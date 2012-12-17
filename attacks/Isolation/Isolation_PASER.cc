/**
 *\class       Isolation_PASER
 *@brief       Class implements a blackhole isolation attack on the PASER routing protocol
 *\authors     Eugen.Paul | Mohamad.Sbeiti \@paser.info
 *
 *\copyright   (C) 2012 Communication Networks Institute (CNI - Prof. Dr.-Ing. Christian Wietfeld)
 *                  at Technische Universitaet Dortmund, Germany
 *                  http://www.kn.e-technik.tu-dortmund.de/
 *
 *
 *              This program is free software; you can redistribute it
 *              and/or modify it under the terms of the GNU General Public
 *              License as published by the Free Software Foundation; either
 *              version 2 of the License, or (at your option) any later
 *              version.
 *              For further information see file COPYING
 *              in the top level directory
 ********************************************************************************
 * This work is part of the secure wireless mesh networks framework, which is currently under development by CNI
 ********************************************************************************/


#include "Isolation_PASER.h"
#include "Ieee80211Frame_m.h"
#include "IPv4Datagram_m.h"
#include "UDPPacket_m.h"
#include "IPvXAddressResolver.h"

//#include "Ieee80211aConsts.h"
#include "AirFrame_m.h"
#include "PASER_UB_RREQ.h"
#include "IPv4ControlInfo.h"

Define_Module(Isolation_PASER);

void Isolation_PASER::initialize()
{
    startMessage = new cMessage("startMessage");
    simtime_t timer = simTime()+par("messageTimer");
    scheduleAt(timer, startMessage);
}

void Isolation_PASER::handleMessage(cMessage *msg)
{
    if(msg==startMessage){
        IPvXAddress srcIPAddr = IPvXAddressResolver().resolve(par("isoTargetIP"));
        struct in_addr srcAdd;
        srcAdd.S_addr = srcIPAddr.get4().getInt();
        IPvXAddress destIPAddr = IPvXAddressResolver().resolve(par("isoSearchIP"));
        struct in_addr destAdd;
        destAdd.S_addr = destIPAddr.get4().getInt();
        ev << "send UBRREQ from " << srcAdd.S_addr.getIPAddress().str() << " to " << destAdd.S_addr.getIPAddress().str() << "\n";
        PASER_UB_RREQ* packet = new PASER_UB_RREQ(srcAdd, destAdd, (int)par("seqNr"));
        double current_time;
        double tmp;
        struct timeval tv;
        current_time =SIMTIME_DBL(simTime());
        tv.tv_sec = (long)current_time; /* Remove decimal part */
        tmp = (current_time - tv.tv_sec) * 1000000;
        tv.tv_usec = (long)(tmp+0.5);
        if (tv.tv_usec>1000000)
        {
            tv.tv_sec++;
            tv.tv_usec -=1000000;
        }
        packet->timestamp = tv.tv_sec;
        packet->GFlag = 0;
        packet->seqForw = (int)par("seqNr");

        address_list myAddrList;
        myAddrList.ipaddr = srcAdd;
        packet->AddressRangeList.push_back(myAddrList);
        packet->metricBetweenQueryingAndForw = 0;

        lv_block certForw;
        certForw.len = 10;
        certForw.buf = (u_int8_t *)malloc(sizeof(u_int8_t) * certForw.len);
        memset (certForw.buf,'-',10);
        packet->certForw.buf = certForw.buf;
        packet->certForw.len = certForw.len;

        u_int8_t * root = (u_int8_t *)malloc(sizeof(u_int8_t) * PASER_SECRET_LEN);
        memset (root,'-',PASER_SECRET_LEN);
        packet->root = root;
        packet->initVector = 1;

        geo_pos myGeo;
        myGeo.lat = 228;
        myGeo.lon = 97;

        packet->geoQuerying.lat = myGeo.lat;
        packet->geoQuerying.lon = myGeo.lon;
        packet->geoForwarding.lat = myGeo.lat;
        packet->geoForwarding.lon = myGeo.lon;

        u_int32_t sig_len = PASER_sign_len;
        u_int8_t *sign = (u_int8_t *)malloc(sizeof(u_int8_t) * sig_len);
        memset (sign,'-',PASER_sign_len);
        packet->sign.buf = sign;
        packet->sign.len = sig_len;

        UDPPacket *tempUDP = new UDPPacket("rreq", 1);
        tempUDP->encapsulate(packet);
        tempUDP->setBitLength(100);
        tempUDP->setDestinationPort(PASER_PORT);
        tempUDP->setSourcePort(PASER_PORT);

        IPv4ControlInfo *ipControlInfo = new IPv4ControlInfo();
        struct in_addr bcAddr;
        bcAddr.S_addr = PASER_BROADCAST;
        IPv4Address add = bcAddr.S_addr.getIPAddress();
        ipControlInfo->setDestAddr(add);
        ipControlInfo->setProtocol(IP_PROT_MANET);
        ipControlInfo->setTimeToLive(1);
        tempUDP->setControlInfo(ipControlInfo);
        ipControlInfo->setSrcAddr(srcAdd.S_addr.getIPAddress());

        IPv4Datagram *tempIPData = new IPv4Datagram("rreq", 1);
        tempIPData->encapsulate(tempUDP);
        tempIPData->setSrcAddress(srcAdd.S_addr.getIPAddress());
        tempIPData->setDestAddress(bcAddr.S_addr.getIPAddress());
        tempIPData->setTransportProtocol(254);

        Ieee80211DataFrame *tempIeee = new Ieee80211DataFrame("rreq", 1);
        tempIeee->encapsulate(tempIPData);
        tempIeee->setReceiverAddress(MACAddress::BROADCAST_ADDRESS);
        tempIeee->setDuration(0.000005);

        send(tempIeee, "OUTin");
//        sendToUDP(packet,PASER_PORT,"255.255.255.255");
        simtime_t timer = simTime()+par("messageTimer");
        scheduleAt(timer, startMessage);
        return;
    }

    delete msg;
    return;
}

