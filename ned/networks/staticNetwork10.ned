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


network staticNetwork10
{
    @display("bgb=1179,270");
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
                @display("p=974,116;r=230,,blue;i=device/server2");
                isGW = true;
                routingFile = "routing_tables/gw.rt";
        }
        Key_Distribution_Center: StandardHost {
            @display("p=1112,69");
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
                @display("p=657,36;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz4.rt";
        }
        host_no_send5: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=657,188;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz5.rt";
        }
        host_no_send6: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=820,36;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz6.rt";
        }
        host_no_send7: paser_FixManetRoutingHostShare {
            parameters:
                @display("p=820,188;r=230,,blue;i=device/smallrouter");
                isGW = false;
                routingFile = "routing_tables/host_no_send/host_no_send_ohne_subnetz7.rt";
        }
    connections allowunconnected:
        gw0.ethg++ <--> ethline <--> Key_Distribution_Center.ethg++;
}
