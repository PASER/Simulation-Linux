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

#ifndef Isolation_OLSR_H_
#define Isolation_OLSR_H_

#ifndef NS_PORT
#define NS_PORT
#endif
#ifndef OMNETPP
#define OMNETPP
#endif

#include <omnetpp.h>
//#include "AirFrame_m.h"
#include "RadioState.h"
#include "ChannelAccess.h"
#include "compatibility.h"

class Isolation_OLSR : public ChannelAccess {
    void initialize(int stage);
    void handleMessage(cMessage *msg);
    bool doForwardPacket(cMessage *msg);

    double getPacketDelay(cMessage *msg);

    virtual void receiveChangeNotification(int category, const cPolymorphic *details);

    void sendHelloAndTcMessage(struct in_addr target);

private:
    cMessage *startMessage;
    int seqPlus;

    std::list<cMessage *> messageList;
    RadioState::State radioState;
};

#endif /* Isolation_OLSR_H_ */