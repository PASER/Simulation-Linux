/**
 *\class       Isolation_AODV
 *@brief       Class implements a blackhole isolation attack on the AODV routing protocol
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


#include "Isolation_AODV.h"
#include "Ieee80211Frame_m.h"
#include "IPv4Datagram_m.h"
#include "UDPPacket_m.h"
#include "IPvXAddressResolver.h"

//#include "Ieee80211aConsts.h"
#include "AirFrame_m.h"
#include "IPv4ControlInfo.h"

#include "aodv_msg_struct.h"
#include "defs_aodv.h"

Define_Module(Isolation_AODV);

void Isolation_AODV::initialize()
{
    startMessage = new cMessage("startMessage");
    simtime_t timer = simTime()+par("startTime");
    scheduleAt(timer, startMessage);
    seqPlus = 0;
}

void Isolation_AODV::handleMessage(cMessage *msg)
{
    if(msg==startMessage){
        IPvXAddress srcIPAddr = IPvXAddressResolver().resolve(par("isoTargetIP"));
        struct in_addr srcAdd;
        srcAdd.S_addr = srcIPAddr.get4().getInt();
        IPvXAddress destIPAddr = IPvXAddressResolver().resolve(par("isoSearchIP"));
        struct in_addr destAdd;
        destAdd.S_addr = destIPAddr.get4().getInt();
        ev << "send UBRREQ from " << srcAdd.S_addr.getIPAddress().str() << " to " << destAdd.S_addr.getIPAddress().str() << "\n";

        RREQ *rreq;
        rreq = new RREQ();
        rreq->cost=0;
        rreq->type = 1;
        rreq->res1 = 0;
        rreq->res2 = 0;
        rreq->hcnt = 0;
        rreq->rreq_id = (seqPlus);
        rreq->dest_addr = destAdd.S_addr;
//        rreq->dest_seqno = htonl((int)par("seqNr"));
        rreq->dest_seqno = (0);
        rreq->orig_addr = srcAdd.S_addr;
        rreq->orig_seqno = (int)par("seqNr")+seqPlus;
        seqPlus++;
        rreq->ttl = 99;

        UDPPacket *tempUDP = new UDPPacket("rreq", 1);
        tempUDP->encapsulate(rreq);
        tempUDP->setBitLength(1000);
        tempUDP->setDestinationPort(AODV_PORT);
        tempUDP->setSourcePort(AODV_PORT);

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

