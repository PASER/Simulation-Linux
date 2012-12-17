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


#ifndef Isolation_PASER_H_
#define Isolation_PASER_H_

#include "PASER_Definitions.h"

#include <omnetpp.h>
//#include "AirFrame_m.h"

class Isolation_PASER : public cSimpleModule {
    void initialize();
    void handleMessage(cMessage *msg);
    bool doForwardPacket(cMessage *msg);

    double getPacketDelay(cMessage *msg);

//    AirFrame *encapsulatePacket(cPacket *frame);
//    void updateSensitivity(double rate);
private:
    cMessage *startMessage;
};

#endif /* Isolation_PASER_H_ */
