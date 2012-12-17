//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package ned.networks;

import inet.nodes.inet.StandardHost;
import inet.world.radio.ChannelControl;
import ned.DatarateChannel;
import ned.nodes.paser_FixManetRoutingHostShare;


network staticNetwork30
{
    @display("bgb=1661,566");
    types:
        channel ethline extends DatarateChannel
        {
            delay = 50ns;
            datarate = 100Mbps;
        }
    submodules:
        channelControl: ChannelControl {
            @display("p=60,50");
        }
        host_send: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=146,97;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_send_ohne_subnetz.rt";
        }
        gw0: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=1427,474;r=230,,blue;i=device/server2");
                isGW = true;
                routingFile = "routing_tables/gw.rt";
        }
        Key_Distribution_Center: StandardHost {
            @display("p=1572,427");
            routingFile = "routing_tables/Key_Distribution_Center.rt";
            udpType = "UDP";
            numUdpApps = 1;
        }

        host_send1: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=333,36;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_send1_ohne_subnetz.rt";
        }
        host_send2: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=333,188;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_send2_ohne_subnetz.rt";
        }
        host_no_send2: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=494,36;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz2.rt";
        }
        host_no_send3: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=494,188;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz3.rt";
        }
        host_no_send4: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=650,36;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz4.rt";
        }
        host_no_send5: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=650,188;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz5.rt";
        }
        host_no_send6: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=819,36;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz6.rt";
        }
        host_no_send7: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=819,188;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz7.rt";
        }
        host_no_send8: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=972,36;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz8.rt";
        }
        host_no_send9: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=972,188;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz9.rt";
        }
        host_no_send10: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=1133,36;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz10.rt";
        }
        host_no_send11: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=1133,188;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz11.rt";
        }
        host_no_send12: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=1296,36;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz12.rt";
        }
        host_no_send13: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=1296,188;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz13.rt";
        }
        host_send3: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=333,328;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_send3_ohne_subnetz.rt";
        }
        host_send4: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=333,480;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_send4_ohne_subnetz.rt";
        }
        host_no_send16: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=494,328;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz16.rt";
        }
        host_no_send17: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=494,480;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz17.rt";
        }
        host_no_send18: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=650,328;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz18.rt";
        }
        host_no_send19: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=650,480;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz19.rt";
        }
        host_no_send20: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=819,328;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz20.rt";
        }
        host_no_send21: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=819,480;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz21.rt";
        }
        host_no_send22: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=972,328;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz22.rt";
        }
        host_no_send23: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=972,480;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz23.rt";
        }
        host_no_send24: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=1133,328;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz24.rt";
        }
        host_no_send25: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=1133,480;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz25.rt";
        }
        host_no_send26: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=1296,328;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz26.rt";
        }
        host_no_send27: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=1296,480;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz27.rt";
        }
    connections allowunconnected:
        gw0.ethg++ <--> ethline <--> Key_Distribution_Center.ethg++;
}
