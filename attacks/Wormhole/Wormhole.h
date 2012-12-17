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

#ifndef Wormhole_H_
#define Wormhole_H_


#include <omnetpp.h>
#include <list>
#include "RadioState.h"
//#include "ChannelAccess.h"
#include "NotificationBoard.h"

class Wormhole : public INotifiable, public cSimpleModule{
    void initialize(int stage);
    void handleMessage(cMessage *msg);
    bool doForwardPacket(cMessage *msg);

    virtual void receiveChangeNotification(int category, const cPolymorphic *details);

private:
    RadioState::State radioState;
    NotificationBoard *nb;
    std::list<cMessage *> messageList;
};

#endif /* Wormhole_H_ */
