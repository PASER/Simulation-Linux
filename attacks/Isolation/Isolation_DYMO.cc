/**
 *\class       Isolation_DYMO
 *@brief       Class implements a blackhole isolation attack on the DYMO routing protocol
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


#include "Isolation_DYMO.h"
#include "Ieee80211Frame_m.h"
#include "IPv4Datagram_m.h"
#include "UDPPacket_m.h"
#include "IPvXAddressResolver.h"

//#include "Ieee80211aConsts.h"
#include "AirFrame_m.h"
#include "IPv4ControlInfo.h"

#include "dymo_msg_struct.h"
#include "dymo_generic.h"

Define_Module(Isolation_DYMO);

void Isolation_DYMO::initialize()
{
    startMessage = new cMessage("startMessage");
    simtime_t timer = simTime()+par("startTime");
    scheduleAt(timer, startMessage);
    seqPlus = 0;
}

void Isolation_DYMO::handleMessage(cMessage *msg)
{
    if(msg==startMessage){
        IPvXAddress srcIPAddr = IPvXAddressResolver().resolve(par("isoTargetIP"));
        struct in_addr srcAdd;
        srcAdd.S_addr = srcIPAddr.get4().getInt();
        IPvXAddress destIPAddr = IPvXAddressResolver().resolve(par("isoSearchIP"));
        struct in_addr destAdd;
        destAdd.S_addr = destIPAddr.get4().getInt();
        ev << "send UBRREQ from " << srcAdd.S_addr.getIPAddress().str() << " to " << destAdd.S_addr.getIPAddress().str() << "\n";

        RE *re;
        re      = new RE("RE_DymoMsg_RREQ");
        re->newBocks(1);
        re->re_blocks[0].cost=0;
//        re->re_blocks[0].staticNode=isStaticNode();
        re->re_blocks[0].staticNode=false;
//        if (this->isStaticNode())
        if (false)
             re->re_blocks[0].re_hopfix=1;
        else
             re->re_blocks[0].re_hopfix=0;
        re->m       = 0;
        re->h       = 0;
        re->type    = 1;
//        re->type    = DYMO_RE_TYPE;
        re->a       = 1;
        re->s       = 0;
        re->i       = 0;
        re->res1    = 0;
        re->res2    = 0;
        re->ttl     = 50;
//        re->len     = RE_BASIC_SIZE + RE_BLOCK_SIZE;
        re->len     = 13U + 10;
//        re->thopcnt = thopcnt;
        re->thopcnt = 0;
        re->target_addr     = destAdd.S_addr;
//        re->target_seqnum   = htonl(target_seqnum);
        re->target_seqnum   = 0;

        re->re_blocks[0].g      = 0;
//        re->re_blocks[0].prefix     = prefix;
        re->re_blocks[0].prefix     = 0;
        re->re_blocks[0].res        = 0;
        re->re_blocks[0].re_hopcnt  = 0;
        re->re_blocks[0].re_node_addr   = srcAdd.S_addr;
        re->re_blocks[0].re_node_seqnum = (int)par("seqNr")+seqPlus;
        re->re_blocks[0].from_proactive=0;
        seqPlus++;

        UDPPacket *tempUDP = new UDPPacket("rreq", 1);
        tempUDP->encapsulate(re);
        tempUDP->setBitLength(1000);
        tempUDP->setDestinationPort(DYMO_PORT);
        tempUDP->setSourcePort(DYMO_PORT);

        IPv4ControlInfo *ipControlInfo = new IPv4ControlInfo();
        struct in_addr bcAddr;
        bcAddr.S_addr = ((in_addr_t) 0xFFFFFFFF);
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
        simtime_t timer = simTime()+par("messageTimer");
        scheduleAt(timer, startMessage);
        return;
    }

    delete msg;
    return;
}

