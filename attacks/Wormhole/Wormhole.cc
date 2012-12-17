/**
 *\class       Wormhole
 *@brief       Class implements a wormhole attack
 *@ingroup     Buffer
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

#include "Wormhole.h"
#include "Ieee80211Frame_m.h"
#include "Ieee80211MgmtFrames_m.h"
#include "IPv4Datagram_m.h"
#include "UDPPacket_m.h"

//#include "Ieee80211aConsts.h"
#include "AirFrame_m.h"
#include "NotifierConsts.h"

Define_Module(Wormhole);

void Wormhole::initialize(int stage)
{
//    ChannelAccess::initialize(stage);

    nb = NotificationBoardAccess().get();

    radioState = RadioState::IDLE;
    if(stage == 0){
        nb->subscribe(this, NF_RADIOSTATE_CHANGED);
        WATCH(radioState);
    }
}

void Wormhole::receiveChangeNotification(int category, const cPolymorphic *details)
{
    if (category==NF_RADIOSTATE_CHANGED)
    {
        RadioState * rstate = check_and_cast<RadioState *>(details);

        RadioState::State newRadioState = rstate->getState();

        radioState = newRadioState;
        if(newRadioState == RadioState::IDLE){
            ///send next Message
            if(messageList.size() > 0){
                send(messageList.front(), "OUTin");
                messageList.pop_front();
                radioState = RadioState::TRANSMIT;
            }
        }
    }
}

void Wormhole::handleMessage(cMessage *msg)
{
    ev << "incomming message on: " << msg->getArrivalGate()->getBaseName() << " - " << msg->getArrivalGateId() << "\n";
    if(!doForwardPacket(msg)){
        delete msg;
        return;
    }
    if(msg->getArrivalGateId() == 0){
        send(msg, "myeth$o");
    }
    else{
        if(radioState == RadioState::IDLE){
            send(msg, "OUTin");
            radioState = RadioState::TRANSMIT;
        }
        else{
            messageList.push_back(msg);
            return;
        }
    }
}

bool Wormhole::doForwardPacket(cMessage *msg){
    if(simTime() < 100.0){
        return false;
    }
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
    if(dynamic_cast<Ieee80211DataFrame *>(msg) && msg->getArrivalGateId() == 0){
        Ieee80211DataFrame *tempIeee = dynamic_cast<Ieee80211DataFrame *>(msg);
        if(tempIeee->getTransmitterAddress().isBroadcast()){
            return true;
        }
        else{
            Ieee80211ACKFrame *frame = new Ieee80211ACKFrame("wlan-ack");
            frame->setReceiverAddress(tempIeee->getTransmitterAddress());
            frame->setDuration(0);
            if(radioState == RadioState::IDLE){
                send(frame, "OUTin");
                radioState = RadioState::TRANSMIT;
            }
            else{
                messageList.push_back(frame);
            }
        }
    }
    else if(dynamic_cast<Ieee80211ACKFrame *>(msg)){
        return false;
    }
    else if(dynamic_cast<Ieee80211ActionFrame *>(msg) && msg->getArrivalGateId() == 0){
        Ieee80211ActionFrame *tempIeee = dynamic_cast<Ieee80211ActionFrame *>(msg);
        if(tempIeee->getTransmitterAddress().isBroadcast()){
            return true;
        }
        else{
            Ieee80211ACKFrame *frame = new Ieee80211ACKFrame("wlan-ack");
            frame->setReceiverAddress(tempIeee->getTransmitterAddress());
            frame->setDuration(0);
            if(radioState == RadioState::IDLE){
                send(frame, "OUTin");
                radioState = RadioState::TRANSMIT;
            }
            else{
                messageList.push_back(frame);
            }
        }
    }
    return true;
}
