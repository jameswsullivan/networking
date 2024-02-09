# Topology:
# GigabitEthernet0/0 — ISP1
# GigabitEthernet0/1 — ISP2
# GigabitEthernet0/2 — connected to switch where VLANs are defined.
# VLAN 1: 10.0.0.0/16 — use ISP1
# VLAN 2:192.168.0.0/24 — use ISP2

# Configure NAT:
config t
ip access-list extended NAT_ISP1
permit ip 10.0.0.0 0.0.255.255 any
exit

ip access-list extended NAT_ISP2
permit ip 192.168.0.0 0.0.0.255 any
exit

# Configure Route Map:
route-map PBR permit 1000
match ip address NAT_ISP1
set interface GigabitEthernet0/0
exit

route-map PBR permit 2000
match ip address NAT_ISP2
set interface GigabitEthernet0/1
exit

# Configure interfaces:
interface GigabitEthernet0/0
ip address dhcp
ip nat outside
ip virtual-reassembly in
duplex full
speed 1000
exit

interface GigabitEthernet0/1
ip address dhcp
ip nat outside
ip virtual-reassembly in
duplex full
speed 1000
exit

interface GigabitEthernet0/2
ip address <your_ip_address> <your_subnet_mask>
ip nat inside
ip virtual-reassembly in
ip policy route-map PBR
duplex full
speed 1000
exit

# Enable NAT:
ip nat inside source list NAT_ISP1 interface GigabitEthernet0/0 overload
ip nat inside source list NAT_ISP2 interface GigabitEthernet0/1 overload