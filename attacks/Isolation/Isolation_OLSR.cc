/**
 *\class       Isolation_OLSR
 *@brief       Class implements a blackhole isolation attack on the OLSR routing protocol
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

#include "Isolation_OLSR.h"
#include "Ieee80211Frame_m.h"
#include "IPv4Datagram_m.h"
#include "UDPPacket_m.h"
#include "IPvXAddressResolver.h"

//#include "Ieee80211aConsts.h"
#include "AirFrame_m.h"
#include "IPv4ControlInfo.h"

#include "OLSRpkt_m.h"
#include "OLSR.h"

Define_Module(Isolation_OLSR);

void Isolation_OLSR::initialize(int stage)
{
    ChannelAccess::initialize(stage);

    if (stage == 1) {
        startMessage = new cMessage("startMessage");
        simtime_t timer = simTime() + par("startTime");
        scheduleAt(timer, startMessage);
        seqPlus = 0;
    }

    radioState = RadioState::IDLE;
    if(stage == 1){
        nb->subscribe(this, NF_RADIOSTATE_CHANGED);
        WATCH(radioState);
    }
}

void Isolation_OLSR::receiveChangeNotification(int category, const cPolymorphic *details)
{
    if (category==NF_RADIOSTATE_CHANGED)
    {
        RadioState * rstate = check_and_cast<RadioState *>(details);

        RadioState::State newRadioState = rstate->getState();

        radioState = newRadioState;
        if(newRadioState == RadioState::IDLE){
            //send next Message
            if(messageList.size() > 0){
                send(messageList.front(), "OUTin");
                messageList.pop_front();
                radioState = RadioState::TRANSMIT;
            }
        }
    }
}

void Isolation_OLSR::sendHelloAndTcMessage(struct in_addr target){
    ///generate and send Hello message
    if(true){
    //    IPvXAddress srcIPAddr = IPAddressResolver().resolve(par("isoTargetIP"));
        struct in_addr srcAdd;
        srcAdd.S_addr = target.S_addr;
    //    srcAdd.S_addr = srcIPAddr.get4().getInt();
        IPvXAddress destIPAddr = IPvXAddressResolver().resolve(par("isoSearchIP"));
        struct in_addr destAdd;
        destAdd.S_addr = destIPAddr.get4().getInt();
        IPvXAddress neighIPAddr = IPvXAddressResolver().resolve(par("isoNeighborIP"));
        struct in_addr neighAdd;
        neighAdd.S_addr = neighIPAddr.get4().getInt();
        IPvXAddress neighIPAddr1 = IPvXAddressResolver().resolve(par("isoNeighborIP_1"));
        struct in_addr neighAdd1;
        neighAdd1.S_addr = neighIPAddr1.get4().getInt();
        IPvXAddress neighIPAddr2 = IPvXAddressResolver().resolve(par("isoNeighborIP_2"));
        struct in_addr neighAdd2;
        neighAdd2.S_addr = neighIPAddr2.get4().getInt();
        ev << "send UBRREQ from " << srcAdd.S_addr.getIPAddress().str() << " to " << destAdd.S_addr.getIPAddress().str() << "\n";

        OLSR_msg msg;
    //        double now          = CURRENT_TIME;
        msg.msg_type()      = OLSR_HELLO_MSG;
//        msg.vtime()         = OLSR::seconds_to_emf(OLSR_NEIGHB_HOLD_TIME);
        msg.vtime()         = OLSR::seconds_to_emf(3*2);
        msg.orig_addr()     = srcAdd.S_addr;
        msg.ttl()           = 1;
        msg.hop_count()     = 0;
        msg.msg_seq_num()   = (int16_t)par("seqNr")+(int16_t)seqPlus;

        msg.hello().reserved()      = 0;
        msg.hello().htime()         = OLSR::seconds_to_emf(1);
        msg.hello().willingness()   = 0;
        msg.hello().count           = 0;

        uint8_t link_type, nb_type, link_code;

        link_type = OLSR_SYM_LINK;
        nb_type = OLSR_MPR_NEIGH;

        int count = msg.hello().count;
        link_code = (link_type & 0x03) | ((nb_type << 2) & 0x0f);

        assert(count >= 0 && count < OLSR_MAX_HELLOS);
        msg.hello().hello_msg(count).count = 0;
    //        msg.hello().hello_msg(count).link_code() = link_code;
        msg.hello().hello_msg(count).link_code() = OLSR_SYM_LINK | 0x08;
        msg.hello().hello_msg(count).reserved() = 0;
        msg.hello().count++;

        int i = msg.hello().hello_msg(count).count;
        assert(count >= 0 && count < OLSR_MAX_HELLOS);
        assert(i >= 0 && i < OLSR_MAX_ADDRS);

        msg.hello().hello_msg(count).nb_iface_addr(i) = neighAdd.S_addr;
        msg.hello().hello_msg(count).count++;
        if(par("isAngreiferInMitte").boolValue()){
            msg.hello().hello_msg(count).nb_iface_addr(i+1) = neighAdd1.S_addr;
            msg.hello().hello_msg(count).count++;
            msg.hello().hello_msg(count).nb_iface_addr(i+2) = neighAdd2.S_addr;
            msg.hello().hello_msg(count).count++;
        }
        msg.hello().hello_msg(count).link_msg_size() =  msg.hello().hello_msg(count).size();

        msg.msg_size() = msg.size();


        OLSR_pkt* op        = new OLSR_pkt;
        op->setName("OLSR Pkt");

        op->setByteLength( OLSR_PKT_HDR_SIZE );
        op->setPkt_seq_num( (int16_t)par("seqNr")+(int16_t)seqPlus );
        op->setReduceFuncionality(false);
        op->setMsgArraySize(1);
        op->setMsg(0,msg);
        op->setByteLength(op->getByteLength()+msg.size());

        seqPlus++;
        UDPPacket *tempUDP = new UDPPacket("rreq", 1);
        tempUDP->encapsulate(op);
        tempUDP->setBitLength(1000);
        tempUDP->setDestinationPort(698);
        tempUDP->setSourcePort(698);

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

    //        send(tempIeee, "OUTin");
        if(radioState == RadioState::IDLE){
            send(tempIeee, "OUTin");
            radioState = RadioState::TRANSMIT;
        }
        else{
            messageList.push_back(tempIeee);
        }
    //        simtime_t timer = simTime()+par("messageTimer");
    //        scheduleAt(timer, startMessage);
    //        return;
    }

    ///generate and send TC message
//    IPvXAddress srcIPAddr = IPAddressResolver().resolve(par("isoTargetIP"));
    struct in_addr srcAdd;
    srcAdd.S_addr = target.S_addr;
//    srcAdd.S_addr = srcIPAddr.get4().getInt();
    IPvXAddress destIPAddr = IPvXAddressResolver().resolve(par("isoSearchIP"));
    struct in_addr destAdd;
    destAdd.S_addr = destIPAddr.get4().getInt();
//    IPvXAddress neighIPAddr = IPAddressResolver().resolve(par("isoNeighborIP"));
//    struct in_addr neighAdd;
//    neighAdd.S_addr = neighIPAddr.get4().getInt();
    ev << "send UBRREQ from " << srcAdd.S_addr.getIPAddress().str() << " to " << destAdd.S_addr.getIPAddress().str() << "\n";

    OLSR_msg msg;
//        double now          = CURRENT_TIME;
    msg.msg_type()      = OLSR_TC_MSG;
//    msg.vtime()         = OLSR::seconds_to_emf(OLSR_NEIGHB_HOLD_TIME);
    msg.vtime()         = OLSR::seconds_to_emf(3*2);
    msg.orig_addr()     = srcAdd.S_addr;
    msg.ttl()           = 255;
    msg.hop_count()     = 0;
    msg.msg_seq_num()   = (int16_t)par("seqNr")+(int16_t)seqPlus;

    msg.tc().ansn()     = (int16_t)par("seqNr")+(int16_t)seqPlus;
    msg.tc().reserved() = 0;
    msg.tc().count      = 0;

    msg.tc().nb_main_addr(0) = srcAdd.S_addr;
    msg.tc().count++;

    msg.msg_size()      = msg.size();

    OLSR_pkt* op        = new OLSR_pkt;
    op->setName("OLSR Pkt");

    op->setByteLength( OLSR_PKT_HDR_SIZE );
    op->setPkt_seq_num( (int16_t)par("seqNr")+(int16_t)seqPlus );
    op->setReduceFuncionality(false);
    op->setMsgArraySize(1);
    op->setMsg(0,msg);
    op->setByteLength(op->getByteLength()+msg.size());

    seqPlus++;
    UDPPacket *tempUDP = new UDPPacket("rreq", 1);
    tempUDP->encapsulate(op);
    tempUDP->setBitLength(1000);
    tempUDP->setDestinationPort(698);
    tempUDP->setSourcePort(698);

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

//        send(tempIeee, "OUTin");
    if(radioState == RadioState::IDLE){
        send(tempIeee, "OUTin");
        radioState = RadioState::TRANSMIT;
    }
    else{
        messageList.push_back(tempIeee);
    }

    return;
}

void Isolation_OLSR::handleMessage(cMessage *msg)
{
    //send Hello messages
    if(msg==startMessage){
        IPvXAddress srcIPAddr = IPvXAddressResolver().resolve(par("isoTargetIP"));
        struct in_addr srcAdd;
        srcAdd.S_addr = srcIPAddr.get4().getInt();
        IPvXAddress srcIPAddr1 = IPvXAddressResolver().resolve(par("isoTargetIP_1_OLSR"));
        struct in_addr srcAdd1;
        srcAdd1.S_addr = srcIPAddr1.get4().getInt();
        IPvXAddress srcIPAddr2 = IPvXAddressResolver().resolve(par("isoTargetIP_2_OLSR"));
        struct in_addr srcAdd2;
        srcAdd2.S_addr = srcIPAddr2.get4().getInt();
        sendHelloAndTcMessage(srcAdd);
        sendHelloAndTcMessage(srcAdd1);
        sendHelloAndTcMessage(srcAdd2);
        simtime_t timer = simTime()+par("messageTimer");
        if(startMessage->isScheduled()){
            cancelEvent(startMessage);
            scheduleAt(timer, startMessage);
        }
        else{
            scheduleAt(timer, startMessage);
        }
        return;
    }

    delete msg;
    return;
}

