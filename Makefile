#
# OMNeT++/OMNEST Makefile for PASER
#
# This file was generated with the command:
#  opp_makemake -f --deep -o PASER -O out -I../inetmanet/src/transport/sctp -I../inetmanet/src/networklayer/manetrouting/manetStats -I../inetmanet/src/transport/contract -I../inetmanet/src/networklayer/ipv6tunneling -I../inetmanet/src/util -I../inetmanet/src/linklayer/ieee80211/radio/errormodel -I../inetmanet/src/world/radio -I../inetmanet/src/networklayer/ipv6 -I../inetmanet/src/linklayer/ieee80211mesh/locator -I../inetmanet/src/linklayer/radio -I../inetmanet/src/linklayer/radio/propagation -I../inetmanet/src/util/headerserializers/udp -I../inetmanet/src/util/headerserializers -I../inetmanet/src/networklayer/xmipv6 -I../inetmanet/src/world/powercontrol -I../inetmanet/src/linklayer/ieee80211/radio -I../inetmanet/src/networklayer/ipv4 -I../inetmanet/src/base -I../inetmanet/src/networklayer/contract -I../inetmanet/src/linklayer/ieee80211/mgmt -I../inetmanet/src/linklayer/collStats -I../inetmanet/src/networklayer/arp -I../inetmanet/src/mobility -I../inetmanet/src/battery/models -I../inetmanet/src/transport/tcp_common -I../inetmanet/src/linklayer/ethernet -I../inetmanet/src/generic -I../inetmanet/src/world/obstacles -I../inetmanet/src/util/headerserializers/sctp -I../inetmanet/src/linklayer/ieee80211/mac -I../inetmanet/src/networklayer/queue -I../inetmanet/src/networklayer/common -I../inetmanet/src/applications/pingapp -I../inetmanet/src -I../inetmanet/src/transport/udp -I../inetmanet/src/util/headerserializers/ipv4 -I../inetmanet/src/networklayer/icmpv6 -I../inetmanet/src/util/headerserializers/tcp -I../inetmanet/src/networklayer/manetrouting/base -I../inetmanet/src/linklayer/contract -I../inetmanet/src/linklayer -I../inetmanet/src/networklayer/manetrouting -I../inetmanet/src/mobility/models -I../inetmanet/src/networklayer/manetrouting/dymo -I../inetmanet/src/networklayer/manetrouting/olsr -I../inetmanet/src/networklayer/manetrouting/aodv -I../inetmanet/src/networklayer/manetrouting/batman -I../inetmanet/src/networklayer/manetrouting/dymo/dymoum -I../inetmanet/src/networklayer/manetrouting/aodv/aodv-uu -L../inetmanet/out/$(CONFIGNAME)/src -lssl -lcrypto -linet -KINETMANET_PROJ=../inetmanet
#

# Name of target to be created (-o option)
TARGET = PASER$(EXE_SUFFIX)

# User interface (uncomment one) (-u option)
USERIF_LIBS = $(ALL_ENV_LIBS) # that is, $(TKENV_LIBS) $(CMDENV_LIBS)
#USERIF_LIBS = $(CMDENV_LIBS)
#USERIF_LIBS = $(TKENV_LIBS)

# C++ include paths (with -I)
INCLUDE_PATH = \
    -I../inetmanet/src/transport/sctp \
    -I../inetmanet/src/networklayer/manetrouting/manetStats \
    -I../inetmanet/src/transport/contract \
    -I../inetmanet/src/networklayer/ipv6tunneling \
    -I../inetmanet/src/util \
    -I../inetmanet/src/linklayer/ieee80211/radio/errormodel \
    -I../inetmanet/src/world/radio \
    -I../inetmanet/src/networklayer/ipv6 \
    -I../inetmanet/src/linklayer/ieee80211mesh/locator \
    -I../inetmanet/src/linklayer/radio \
    -I../inetmanet/src/linklayer/radio/propagation \
    -I../inetmanet/src/util/headerserializers/udp \
    -I../inetmanet/src/util/headerserializers \
    -I../inetmanet/src/networklayer/xmipv6 \
    -I../inetmanet/src/world/powercontrol \
    -I../inetmanet/src/linklayer/ieee80211/radio \
    -I../inetmanet/src/networklayer/ipv4 \
    -I../inetmanet/src/base \
    -I../inetmanet/src/networklayer/contract \
    -I../inetmanet/src/linklayer/ieee80211/mgmt \
    -I../inetmanet/src/linklayer/collStats \
    -I../inetmanet/src/networklayer/arp \
    -I../inetmanet/src/mobility \
    -I../inetmanet/src/battery/models \
    -I../inetmanet/src/transport/tcp_common \
    -I../inetmanet/src/linklayer/ethernet \
    -I../inetmanet/src/generic \
    -I../inetmanet/src/world/obstacles \
    -I../inetmanet/src/util/headerserializers/sctp \
    -I../inetmanet/src/linklayer/ieee80211/mac \
    -I../inetmanet/src/networklayer/queue \
    -I../inetmanet/src/networklayer/common \
    -I../inetmanet/src/applications/pingapp \
    -I../inetmanet/src \
    -I../inetmanet/src/transport/udp \
    -I../inetmanet/src/util/headerserializers/ipv4 \
    -I../inetmanet/src/networklayer/icmpv6 \
    -I../inetmanet/src/util/headerserializers/tcp \
    -I../inetmanet/src/networklayer/manetrouting/base \
    -I../inetmanet/src/linklayer/contract \
    -I../inetmanet/src/linklayer \
    -I../inetmanet/src/networklayer/manetrouting \
    -I../inetmanet/src/mobility/models \
    -I../inetmanet/src/networklayer/manetrouting/dymo \
    -I../inetmanet/src/networklayer/manetrouting/olsr \
    -I../inetmanet/src/networklayer/manetrouting/aodv \
    -I../inetmanet/src/networklayer/manetrouting/batman \
    -I../inetmanet/src/networklayer/manetrouting/dymo/dymoum \
    -I../inetmanet/src/networklayer/manetrouting/aodv/aodv-uu \
    -I. \
    -Iattacks \
    -Iattacks/Isolation \
    -Iattacks/Wormhole \
    -Icert \
    -Idocumentation \
    -Idocumentation/PASER-Simulation \
    -Idocumentation/PASER-Simulation/html \
    -Idocumentation/PASER-Simulation/html/search \
    -Idocumentation/attacks \
    -Idocumentation/attacks/html \
    -Idocumentation/attacks/html/search \
    -Ined \
    -Ined/networks \
    -Ined/nodes \
    -Iresults \
    -Irouting_tables \
    -Irouting_tables/WH \
    -Irouting_tables/host_no_send \
    -Isrc \
    -Isrc/IP_ADOPTED \
    -Isrc/paser_buffer \
    -Isrc/paser_configuration \
    -Isrc/paser_logic \
    -Isrc/paser_logic/cryptography \
    -Isrc/paser_logic/message_processing \
    -Isrc/paser_logic/route_discovery \
    -Isrc/paser_logic/route_maintenance \
    -Isrc/paser_message_structure \
    -Isrc/paser_socket \
    -Isrc/paser_tables \
    -Isrc/paser_timer_management \
    -Isrc/simple_kdc \
    -Isrc/simple_kdc/kdc_message \
    -Iudp_app

# Additional object and library files to link with
EXTRA_OBJS =

# Additional libraries (-L, -l options)
LIBS = -L../inetmanet/out/$(CONFIGNAME)/src  -lssl -lcrypto -linet
LIBS += -Wl,-rpath,`abspath ../inetmanet/out/$(CONFIGNAME)/src`

# Output directory
PROJECT_OUTPUT_DIR = out
PROJECTRELATIVE_PATH =
O = $(PROJECT_OUTPUT_DIR)/$(CONFIGNAME)/$(PROJECTRELATIVE_PATH)

# Object files for local .cc and .msg files
OBJS = \
    $O/attacks/Isolation/Isolation_BATMAN.o \
    $O/attacks/Isolation/Isolation_OLSR.o \
    $O/attacks/Isolation/Isolation_AODV.o \
    $O/attacks/Isolation/Isolation_PASER.o \
    $O/attacks/Isolation/Isolation_DYMO.o \
    $O/attacks/Wormhole/Wormhole.o \
    $O/src/IP_ADOPTED/IP_paser.o \
    $O/src/paser_buffer/PASER_Message_Queue.o \
    $O/src/paser_configuration/PASER_Configurations.o \
    $O/src/paser_logic/PASER_Global.o \
    $O/src/paser_logic/cryptography/PASER_Crypto_Sign.o \
    $O/src/paser_logic/cryptography/PASER_Crypto_Root.o \
    $O/src/paser_logic/cryptography/PASER_Crypto_Hash.o \
    $O/src/paser_logic/message_processing/PASER_RERR_List.o \
    $O/src/paser_logic/message_processing/PASER_Message_Processing.o \
    $O/src/paser_logic/route_discovery/PASER_Route_Discovery.o \
    $O/src/paser_logic/route_maintenance/PASER_Route_Maintenance.o \
    $O/src/paser_message_structure/PASER_TU_RREP_ACK.o \
    $O/src/paser_message_structure/PASER_UU_RREP.o \
    $O/src/paser_message_structure/PASER_TU_RREQ.o \
    $O/src/paser_message_structure/PASER_TB_Hello.o \
    $O/src/paser_message_structure/PASER_TU_RREP.o \
    $O/src/paser_message_structure/PASER_UB_Root_Refresh.o \
    $O/src/paser_message_structure/PASER_TB_RERR.o \
    $O/src/paser_message_structure/PASER_MSG.o \
    $O/src/paser_message_structure/PASER_UB_Key_Refresh.o \
    $O/src/paser_message_structure/PASER_UB_RREQ.o \
    $O/src/paser_socket/PASER_Socket.o \
    $O/src/paser_tables/PASER_Neighbor_Entry.o \
    $O/src/paser_tables/PASER_RREQ_List.o \
    $O/src/paser_tables/PASER_Routing_Table.o \
    $O/src/paser_tables/PASER_Routing_Entry.o \
    $O/src/paser_tables/PASER_Neighbor_Table.o \
    $O/src/paser_timer_management/PASER_Timer_Message.o \
    $O/src/paser_timer_management/PASER_Timer_Queue.o \
    $O/src/simple_kdc/SimpleKDC.o \
    $O/udp_app/PASERUdpTrafficSender.o \
    $O/udp_app/PASERUdpTrafficReceiver.o \
    $O/src/simple_kdc/kdc_message/crl_message_m.o \
    $O/udp_app/PaserTrafficDataMsg_m.o

# Message files
MSGFILES = \
    src/simple_kdc/kdc_message/crl_message.msg \
    udp_app/PaserTrafficDataMsg.msg

# Other makefile variables (-K)
INETMANET_PROJ=../inetmanet

#------------------------------------------------------------------------------

# Pull in OMNeT++ configuration (Makefile.inc or configuser.vc)

ifneq ("$(OMNETPP_CONFIGFILE)","")
CONFIGFILE = $(OMNETPP_CONFIGFILE)
else
ifneq ("$(OMNETPP_ROOT)","")
CONFIGFILE = $(OMNETPP_ROOT)/Makefile.inc
else
CONFIGFILE = $(shell opp_configfilepath)
endif
endif

ifeq ("$(wildcard $(CONFIGFILE))","")
$(error Config file '$(CONFIGFILE)' does not exist -- add the OMNeT++ bin directory to the path so that opp_configfilepath can be found, or set the OMNETPP_CONFIGFILE variable to point to Makefile.inc)
endif

include $(CONFIGFILE)

# Simulation kernel and user interface libraries
OMNETPP_LIB_SUBDIR = $(OMNETPP_LIB_DIR)/$(TOOLCHAIN_NAME)
OMNETPP_LIBS = -L"$(OMNETPP_LIB_SUBDIR)" -L"$(OMNETPP_LIB_DIR)" -loppmain$D $(USERIF_LIBS) $(KERNEL_LIBS) $(SYS_LIBS)

COPTS = $(CFLAGS)  $(INCLUDE_PATH) -I$(OMNETPP_INCL_DIR)
MSGCOPTS = $(INCLUDE_PATH)

# we want to recompile everything if COPTS changes,
# so we store COPTS into $COPTS_FILE and have object
# files depend on it (except when "make depend" was called)
COPTS_FILE = $O/.last-copts
ifneq ($(MAKECMDGOALS),depend)
ifneq ("$(COPTS)","$(shell cat $(COPTS_FILE) 2>/dev/null || echo '')")
$(shell $(MKPATH) "$O" && echo "$(COPTS)" >$(COPTS_FILE))
endif
endif

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target
all: $O/$(TARGET)
	$(LN) $O/$(TARGET) .

$O/$(TARGET): $(OBJS)  $(wildcard $(EXTRA_OBJS)) Makefile
	@$(MKPATH) $O
	$(CXX) $(LDFLAGS) -o $O/$(TARGET)  $(OBJS) $(EXTRA_OBJS) $(AS_NEEDED_OFF) $(WHOLE_ARCHIVE_ON) $(LIBS) $(WHOLE_ARCHIVE_OFF) $(OMNETPP_LIBS)

.PHONY: all clean cleanall depend msgheaders

.SUFFIXES: .cc

$O/%.o: %.cc $(COPTS_FILE)
	@$(MKPATH) $(dir $@)
	$(CXX) -c $(COPTS) -o $@ $<

%_m.cc %_m.h: %.msg
	$(MSGC) -s _m.cc $(MSGCOPTS) $?

msgheaders: $(MSGFILES:.msg=_m.h)

clean:
	-rm -rf $O
	-rm -f PASER PASER.exe libPASER.so libPASER.a libPASER.dll libPASER.dylib
	-rm -f ./*_m.cc ./*_m.h
	-rm -f attacks/*_m.cc attacks/*_m.h
	-rm -f attacks/Isolation/*_m.cc attacks/Isolation/*_m.h
	-rm -f attacks/Wormhole/*_m.cc attacks/Wormhole/*_m.h
	-rm -f cert/*_m.cc cert/*_m.h
	-rm -f documentation/*_m.cc documentation/*_m.h
	-rm -f documentation/PASER-Simulation/*_m.cc documentation/PASER-Simulation/*_m.h
	-rm -f documentation/PASER-Simulation/html/*_m.cc documentation/PASER-Simulation/html/*_m.h
	-rm -f documentation/PASER-Simulation/html/search/*_m.cc documentation/PASER-Simulation/html/search/*_m.h
	-rm -f documentation/attacks/*_m.cc documentation/attacks/*_m.h
	-rm -f documentation/attacks/html/*_m.cc documentation/attacks/html/*_m.h
	-rm -f documentation/attacks/html/search/*_m.cc documentation/attacks/html/search/*_m.h
	-rm -f ned/*_m.cc ned/*_m.h
	-rm -f ned/networks/*_m.cc ned/networks/*_m.h
	-rm -f ned/nodes/*_m.cc ned/nodes/*_m.h
	-rm -f results/*_m.cc results/*_m.h
	-rm -f routing_tables/*_m.cc routing_tables/*_m.h
	-rm -f routing_tables/WH/*_m.cc routing_tables/WH/*_m.h
	-rm -f routing_tables/host_no_send/*_m.cc routing_tables/host_no_send/*_m.h
	-rm -f src/*_m.cc src/*_m.h
	-rm -f src/IP_ADOPTED/*_m.cc src/IP_ADOPTED/*_m.h
	-rm -f src/paser_buffer/*_m.cc src/paser_buffer/*_m.h
	-rm -f src/paser_configuration/*_m.cc src/paser_configuration/*_m.h
	-rm -f src/paser_logic/*_m.cc src/paser_logic/*_m.h
	-rm -f src/paser_logic/cryptography/*_m.cc src/paser_logic/cryptography/*_m.h
	-rm -f src/paser_logic/message_processing/*_m.cc src/paser_logic/message_processing/*_m.h
	-rm -f src/paser_logic/route_discovery/*_m.cc src/paser_logic/route_discovery/*_m.h
	-rm -f src/paser_logic/route_maintenance/*_m.cc src/paser_logic/route_maintenance/*_m.h
	-rm -f src/paser_message_structure/*_m.cc src/paser_message_structure/*_m.h
	-rm -f src/paser_socket/*_m.cc src/paser_socket/*_m.h
	-rm -f src/paser_tables/*_m.cc src/paser_tables/*_m.h
	-rm -f src/paser_timer_management/*_m.cc src/paser_timer_management/*_m.h
	-rm -f src/simple_kdc/*_m.cc src/simple_kdc/*_m.h
	-rm -f src/simple_kdc/kdc_message/*_m.cc src/simple_kdc/kdc_message/*_m.h
	-rm -f udp_app/*_m.cc udp_app/*_m.h

cleanall: clean
	-rm -rf $(PROJECT_OUTPUT_DIR)

depend:
	$(MAKEDEPEND) $(INCLUDE_PATH) -f Makefile -P\$$O/ -- $(MSG_CC_FILES)  ./*.cc attacks/*.cc attacks/Isolation/*.cc attacks/Wormhole/*.cc cert/*.cc documentation/*.cc documentation/PASER-Simulation/*.cc documentation/PASER-Simulation/html/*.cc documentation/PASER-Simulation/html/search/*.cc documentation/attacks/*.cc documentation/attacks/html/*.cc documentation/attacks/html/search/*.cc ned/*.cc ned/networks/*.cc ned/nodes/*.cc results/*.cc routing_tables/*.cc routing_tables/WH/*.cc routing_tables/host_no_send/*.cc src/*.cc src/IP_ADOPTED/*.cc src/paser_buffer/*.cc src/paser_configuration/*.cc src/paser_logic/*.cc src/paser_logic/cryptography/*.cc src/paser_logic/message_processing/*.cc src/paser_logic/route_discovery/*.cc src/paser_logic/route_maintenance/*.cc src/paser_message_structure/*.cc src/paser_socket/*.cc src/paser_tables/*.cc src/paser_timer_management/*.cc src/simple_kdc/*.cc src/simple_kdc/kdc_message/*.cc udp_app/*.cc

# DO NOT DELETE THIS LINE -- make depend depends on it.
$O/attacks/Isolation/Isolation_AODV.o: attacks/Isolation/Isolation_AODV.cc \
	attacks/Isolation/Isolation_AODV.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Consts.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/AirFrame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/ModulationType.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddressResolver.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/aodv/aodv-uu/defs_aodv.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/aodv/aodv_msg_struct.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/transport/udp/UDPPacket_m.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/attacks/Isolation/Isolation_BATMAN.o: attacks/Isolation/Isolation_BATMAN.cc \
	attacks/Isolation/Isolation_BATMAN.h \
	$(INETMANET_PROJ)/src/base/BasicModule.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/contract/RadioState.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Consts.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/linklayer/radio/AirFrame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/ModulationType.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddressResolver.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/batman/BatmanData.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/batman/BatmanMsg_m.h \
	$(INETMANET_PROJ)/src/transport/udp/UDPPacket_m.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelAccess.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/attacks/Isolation/Isolation_DYMO.o: attacks/Isolation/Isolation_DYMO.cc \
	attacks/Isolation/Isolation_DYMO.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Consts.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/AirFrame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/ModulationType.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddressResolver.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/dymo/dymo_msg_struct.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/dymo/dymoum/defs_dymo.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/dymo/dymoum/dymo_generic.h \
	$(INETMANET_PROJ)/src/transport/udp/UDPPacket_m.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/attacks/Isolation/Isolation_OLSR.o: attacks/Isolation/Isolation_OLSR.cc \
	attacks/Isolation/Isolation_OLSR.h \
	$(INETMANET_PROJ)/src/base/BasicModule.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/contract/RadioState.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Consts.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/linklayer/radio/AirFrame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/ModulationType.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddressResolver.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/olsr/OLSR.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/olsr/OLSR_ETX_parameter.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/olsr/OLSR_repositories.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/olsr/OLSR_rtable.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/olsr/OLSR_state.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/olsr/OLSRpkt_m.h \
	$(INETMANET_PROJ)/src/transport/udp/UDPPacket_m.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelAccess.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/attacks/Isolation/Isolation_PASER.o: attacks/Isolation/Isolation_PASER.cc \
	attacks/Isolation/Isolation_PASER.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Consts.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/AirFrame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/ModulationType.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddressResolver.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/transport/udp/UDPPacket_m.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/attacks/Wormhole/Wormhole.o: attacks/Wormhole/Wormhole.cc \
	attacks/Wormhole/Wormhole.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/contract/RadioState.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Consts.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mgmt/Ieee80211MgmtFrames_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/AirFrame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/ModulationType.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/transport/udp/UDPPacket_m.h \
	$(INETMANET_PROJ)/src/util/FWMath.h
$O/src/IP_ADOPTED/IP_paser.o: src/IP_ADOPTED/IP_paser.cc \
	src/IP_ADOPTED/IP_paser.h \
	src/paser_configuration/PASER_Definitions.h \
	$(INETMANET_PROJ)/src/base/AbstractQueue.h \
	$(INETMANET_PROJ)/src/base/ByteArray.h \
	$(INETMANET_PROJ)/src/base/ByteArray_m.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/base/ProtocolMap.h \
	$(INETMANET_PROJ)/src/base/QueueBase.h \
	$(INETMANET_PROJ)/src/base/ReassemblyBuffer.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARPPacket_m.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPAccess.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4FragBuf.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4InterfaceData.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ControlManetRouting_m.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/transport/tcp_common/TCPSegment.h \
	$(INETMANET_PROJ)/src/transport/tcp_common/TCPSegment_m.h \
	$(INETMANET_PROJ)/src/transport/udp/UDPPacket_m.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_buffer/PASER_Message_Queue.o: src/paser_buffer/PASER_Message_Queue.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_configuration/PASER_Configurations.o: src/paser_configuration/PASER_Configurations.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4InterfaceData.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_logic/PASER_Global.o: src/paser_logic/PASER_Global.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/BasicModule.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelAccess.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_logic/cryptography/PASER_Crypto_Hash.o: src/paser_logic/cryptography/PASER_Crypto_Hash.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_logic/cryptography/PASER_Crypto_Root.o: src/paser_logic/cryptography/PASER_Crypto_Root.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_logic/cryptography/PASER_Crypto_Sign.o: src/paser_logic/cryptography/PASER_Crypto_Sign.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_logic/message_processing/PASER_Message_Processing.o: src/paser_logic/message_processing/PASER_Message_Processing.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_logic/message_processing/PASER_RERR_List.o: src/paser_logic/message_processing/PASER_RERR_List.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_logic/route_discovery/PASER_Route_Discovery.o: src/paser_logic/route_discovery/PASER_Route_Discovery.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_logic/route_maintenance/PASER_Route_Maintenance.o: src/paser_logic/route_maintenance/PASER_Route_Maintenance.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_message_structure/PASER_MSG.o: src/paser_message_structure/PASER_MSG.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_message_structure/PASER_TB_Hello.o: src/paser_message_structure/PASER_TB_Hello.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_message_structure/PASER_TB_RERR.o: src/paser_message_structure/PASER_TB_RERR.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_message_structure/PASER_TU_RREP.o: src/paser_message_structure/PASER_TU_RREP.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_message_structure/PASER_TU_RREP_ACK.o: src/paser_message_structure/PASER_TU_RREP_ACK.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_message_structure/PASER_TU_RREQ.o: src/paser_message_structure/PASER_TU_RREQ.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_message_structure/PASER_UB_Key_Refresh.o: src/paser_message_structure/PASER_UB_Key_Refresh.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_message_structure/PASER_UB_RREQ.o: src/paser_message_structure/PASER_UB_RREQ.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_message_structure/PASER_UB_Root_Refresh.o: src/paser_message_structure/PASER_UB_Root_Refresh.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_message_structure/PASER_UU_RREP.o: src/paser_message_structure/PASER_UU_RREP.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_socket/PASER_Socket.o: src/paser_socket/PASER_Socket.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4InterfaceData.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ControlManetRouting_m.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/transport/udp/UDPPacket.h \
	$(INETMANET_PROJ)/src/transport/udp/UDPPacket_m.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_tables/PASER_Neighbor_Entry.o: src/paser_tables/PASER_Neighbor_Entry.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_tables/PASER_Neighbor_Table.o: src/paser_tables/PASER_Neighbor_Table.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_tables/PASER_RREQ_List.o: src/paser_tables/PASER_RREQ_List.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_tables/PASER_Routing_Entry.o: src/paser_tables/PASER_Routing_Entry.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_tables/PASER_Routing_Table.o: src/paser_tables/PASER_Routing_Table.cc \
	src/paser_buffer/PASER_Message_Queue.h \
	src/paser_configuration/PASER_Configurations.h \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_logic/PASER_Global.h \
	src/paser_logic/cryptography/PASER_Crypto_Hash.h \
	src/paser_logic/cryptography/PASER_Crypto_Root.h \
	src/paser_logic/cryptography/PASER_Crypto_Sign.h \
	src/paser_logic/message_processing/PASER_Message_Processing.h \
	src/paser_logic/message_processing/PASER_RERR_List.h \
	src/paser_logic/route_discovery/PASER_Route_Discovery.h \
	src/paser_logic/route_maintenance/PASER_Route_Maintenance.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_TB_Hello.h \
	src/paser_message_structure/PASER_TB_RERR.h \
	src/paser_message_structure/PASER_TU_RREP.h \
	src/paser_message_structure/PASER_TU_RREP_ACK.h \
	src/paser_message_structure/PASER_TU_RREQ.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UB_Root_Refresh.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_socket/PASER_Socket.h \
	src/paser_tables/PASER_Neighbor_Entry.h \
	src/paser_tables/PASER_Neighbor_Table.h \
	src/paser_tables/PASER_RREQ_List.h \
	src/paser_tables/PASER_Routing_Entry.h \
	src/paser_tables/PASER_Routing_Table.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211mesh/locator/ILocator.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMP.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/ICMPMessage_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4Route.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4RouteRule.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/ManetRoutingBase.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h \
	$(INETMANET_PROJ)/src/world/radio/ChannelControl.h \
	$(INETMANET_PROJ)/src/world/radio/IChannelControl.h
$O/src/paser_timer_management/PASER_Timer_Message.o: src/paser_timer_management/PASER_Timer_Message.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_message_structure/PASER_UU_RREP.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/paser_timer_management/PASER_Timer_Queue.o: src/paser_timer_management/PASER_Timer_Queue.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_UB_RREQ.h \
	src/paser_timer_management/PASER_Timer_Message.h \
	src/paser_timer_management/PASER_Timer_Queue.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/simple_kdc/SimpleKDC.o: src/simple_kdc/SimpleKDC.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/paser_message_structure/PASER_MSG.h \
	src/paser_message_structure/PASER_UB_Key_Refresh.h \
	src/simple_kdc/SimpleKDC.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddressResolver.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/transport/contract/UDPControlInfo_m.h \
	$(INETMANET_PROJ)/src/transport/contract/UDPSocket.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/src/simple_kdc/kdc_message/crl_message_m.o: src/simple_kdc/kdc_message/crl_message_m.cc \
	src/paser_configuration/PASER_Definitions.h \
	src/simple_kdc/kdc_message/crl_message_m.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/generic/Configuration.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/udp_app/PASERUdpTrafficReceiver.o: udp_app/PASERUdpTrafficReceiver.cc \
	udp_app/PASERUdpTrafficReceiver.h \
	udp_app/PaserTrafficDataMsg_m.h \
	$(INETMANET_PROJ)/src/base/BasicModule.h \
	$(INETMANET_PROJ)/src/base/Coord.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/linklayer/collStats/collStats.h \
	$(INETMANET_PROJ)/src/linklayer/contract/Ieee802Ctrl_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Consts.h \
	$(INETMANET_PROJ)/src/linklayer/ieee80211/mac/Ieee80211Frame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/AirFrame_m.h \
	$(INETMANET_PROJ)/src/linklayer/radio/ModulationType.h \
	$(INETMANET_PROJ)/src/mobility/IMobility.h \
	$(INETMANET_PROJ)/src/mobility/models/LineSegmentsMobilityBase.h \
	$(INETMANET_PROJ)/src/mobility/models/MobilityBase.h \
	$(INETMANET_PROJ)/src/mobility/models/MovingMobilityBase.h \
	$(INETMANET_PROJ)/src/mobility/models/RandomWPMobility.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddressResolver.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/transport/contract/UDPControlInfo_m.h \
	$(INETMANET_PROJ)/src/transport/contract/UDPSocket.h \
	$(INETMANET_PROJ)/src/util/FWMath.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/udp_app/PASERUdpTrafficSender.o: udp_app/PASERUdpTrafficSender.cc \
	udp_app/PASERUdpTrafficSender.h \
	udp_app/PaserTrafficDataMsg_m.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddressResolver.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4InterfaceData.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/base/compatibility.h \
	$(INETMANET_PROJ)/src/networklayer/manetrouting/manetStats/manetStats.h \
	$(INETMANET_PROJ)/src/transport/contract/UDPControlInfo_m.h \
	$(INETMANET_PROJ)/src/transport/contract/UDPSocket.h \
	$(INETMANET_PROJ)/src/util/uint128.h
$O/udp_app/PaserTrafficDataMsg_m.o: udp_app/PaserTrafficDataMsg_m.cc \
	udp_app/PaserTrafficDataMsg_m.h

