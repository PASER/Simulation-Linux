/**
 *\class       Isolation_BATMAN
 *@brief       Class implements a blackhole isolation attack on the BATMAN routing protocol
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

#include "Isolation_BATMAN.h"
#include "Ieee80211Frame_m.h"
#include "IPv4Datagram_m.h"
#include "UDPPacket_m.h"
#include "IPvXAddressResolver.h"

//#include "Ieee80211aConsts.h"
#include "AirFrame_m.h"
#include "IPv4ControlInfo.h"

#include "BatmanMsg_m.h"
#include "BatmanData.h"

Define_Module(Isolation_BATMAN);

void Isolation_BATMAN::initialize(int stage)
{
    ChannelAccess::initialize(stage);

    if(stage == 1){
        startMessage = new cMessage("startMessage");
        simtime_t timer = simTime()+par("startTime");
        scheduleAt(timer, startMessage);
        seqPlus = 0;
    }

    radioState = RadioState::IDLE;
    if(stage == 1){
        nb->subscribe(this, NF_RADIOSTATE_CHANGED);
        WATCH(radioState);
    }
}

void Isolation_BATMAN::receiveChangeNotification(int category, const cPolymorphic *details)
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

void Isolation_BATMAN::handleMessage(cMessage *msg)
{
    if(!doForwardPacket(msg)){
        delete msg;
        return;
    }
    if(msg==startMessage){
        IPvXAddress srcIPAddr = IPvXAddressResolver().resolve(par("isoTargetIP"));
        struct in_addr srcAdd;
        srcAdd.S_addr = srcIPAddr.get4().getInt();
        IPvXAddress destIPAddr = IPvXAddressResolver().resolve(par("isoSearchIP"));
        struct in_addr destAdd;
        destAdd.S_addr = destIPAddr.get4().getInt();
        ev << "send UBRREQ from " << srcAdd.S_addr.getIPAddress().str() << " to " << destAdd.S_addr.getIPAddress().str() << "\n";


        BatmanPacket * pkt=new BatmanPacket("batman");

        pkt->setVersion (0);
        pkt->setFlags (0x40);
        pkt->setTtl (99);
        pkt->setGatewayFlags (0);
        pkt->setSeqNumber ((int)par("seqNr")+seqPlus);
        pkt->setGatewayPort (GW_PORT);
        pkt->setTq (255);
//        pkt->setTq (TQ_MAX_VALUE);
        pkt->setOrig(srcAdd.S_addr);
        pkt->setPrevSender(srcAdd.S_addr);
        seqPlus++;

        UDPPacket *tempUDP = new UDPPacket("rreq", 1);
        tempUDP->encapsulate(pkt);
        tempUDP->setBitLength(1000);
        tempUDP->setDestinationPort(BATMAN_PORT);
        tempUDP->setSourcePort(BATMAN_PORT);

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

        simtime_t timer = simTime()+par("messageTimer");
        scheduleAt(timer, startMessage);
//        delete msg;
        return;
    }
    else if(dynamic_cast<Ieee80211DataFrame *>(msg)){
        Ieee80211DataFrame *tempIeee = dynamic_cast<Ieee80211DataFrame *>(msg);
        cPacket *tempPackIeee = tempIeee->getEncapsulatedPacket();
        if(dynamic_cast<IPv4Datagram *>(tempPackIeee)){
            IPv4Datagram *tempIPData = dynamic_cast<IPv4Datagram *>(tempPackIeee);
            cPacket *tempPackIPData = tempIPData->getEncapsulatedPacket();
            ev << "IPDatagram:OK\n";
            if(dynamic_cast<UDPPacket *>(tempPackIPData)){
                UDPPacket *tempUDP = dynamic_cast<UDPPacket *>(tempPackIPData);
                cPacket *tempUDPData = tempUDP->getEncapsulatedPacket();
                ev << "UDP:OK\n";
                if(tempUDP->getDestinationPort() == BATMAN_PORT){
                    //send ack
                    ev << "PORT:OK\n";
                    if(dynamic_cast<BatmanPacket *>(tempUDPData)){
                        ev << "BATMAN:OK\n";
                        IPvXAddress srcIPAddr = IPvXAddressResolver().resolve(par("isoTargetIP"));
                        struct in_addr srcAdd;
                        srcAdd.S_addr = srcIPAddr.get4().getInt();
                        BatmanPacket * batPack = dynamic_cast<BatmanPacket *>(tempUDPData);
                        if(batPack->getOrig() == srcAdd.S_addr){
                            delete msg;
                            return;
                        }
                        ev << "BATMAN ORIG:OK\n";
                        BatmanPacket * packToSend =new BatmanPacket("batman");

                        packToSend->setVersion (0);
                        packToSend->setFlags (0x40);
                        packToSend->setTtl (batPack->getTtl()-1);
                        packToSend->setGatewayFlags (0);
                        packToSend->setSeqNumber (batPack->getSeqNumber());
                        packToSend->setGatewayPort (GW_PORT);
                        packToSend->setTq (0);
                        packToSend->setOrig(batPack->getOrig());
                        packToSend->setPrevSender(batPack->getPrevSender());
//                        seqPlus++;

                        UDPPacket *tempUDP = new UDPPacket("rreq", 1);
                        tempUDP->encapsulate(packToSend);
                        tempUDP->setBitLength(1000);
                        tempUDP->setDestinationPort(BATMAN_PORT);
                        tempUDP->setSourcePort(BATMAN_PORT);

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

//                        send(tempIeee, "OUTin");
                        if(radioState == RadioState::IDLE){
                            send(tempIeee, "OUTin");
                            radioState = RadioState::TRANSMIT;
                        }
                        else{
                            messageList.push_back(tempIeee);
                        }
                    }
                }
            }
        }
    }

    delete msg;
    return;
}


bool Isolation_BATMAN::doForwardPacket(cMessage *msg){
    if(dynamic_cast<Ieee80211DataFrame *>(msg)){
        Ieee80211DataFrame *tempIeee = dynamic_cast<Ieee80211DataFrame *>(msg);
        cPacket *tempPackIeee = tempIeee->getEncapsulatedPacket();
        if(dynamic_cast<IPv4Datagram *>(tempPackIeee)){
            IPv4Datagram *tempIPData = dynamic_cast<IPv4Datagram *>(tempPackIeee);
            cPacket *tempPackIPData = tempIPData->getEncapsulatedPacket();
            ev << "IPDatagram:OK\n";
            if(dynamic_cast<UDPPacket *>(tempPackIPData)){
                UDPPacket *tempUDP = dynamic_cast<UDPPacket *>(tempPackIPData);
                ev << "UDP:OK\n";
                if(tempUDP->getDestinationPort() == 1234){
                    //send ack
                    Ieee80211ACKFrame *frame = new Ieee80211ACKFrame("wlan-ack");
                    frame->setReceiverAddress(tempIeee->getTransmitterAddress());
                    frame->setDuration(0);
//                    send(frame, "OUTin");
                    if(radioState == RadioState::IDLE){
                        send(frame, "OUTin");
                        radioState = RadioState::TRANSMIT;
                    }
                    else{
                        messageList.push_back(frame);
                    }
                    return false;
                }
            }
        }
    }
    return true;
}

