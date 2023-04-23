*Show Environment*<br>
show env<br><br>

*Show device model and IOS version*<br>
show ver<br><br>

*Change Domain Name*<br>
config t<br>
ip domain name yourdomain.com<br><br>

*Change Device Name*<br>
hostname NEW_HOSTNAME<br><br>

*Show RSA Key*<br>
show crypto key mypubkey rsa<br><br>

*Create new user, RSA key, and enable SSH*<br>
username new_user password new_password<br>
ip ssh version 2<br>
crypto key generate rsa<br><br>

*Delete users*<br>
no username user_to_delete<br><br>

*Save Config*<br>
write memory<br>
copy run start<br><br>

*Show interface IP addresses and status*<br>
show ip int brief<br><br>

*Create DHCP Pools*<br>
ip dhcp pool POOL_NAME<br>
network NETWORK_IP SUBNET_MASK<br>
default-router IP<br>
dns-server DNS1 DNS2 DNS3<br><br>

ip dhcp excluded-address START_IP END_IP<br><br>

*SSH Sessions to older Cisco devices*<br>
Error: Unable to negotiate with 10.0.0.2 port 22: no matching cipher found. Their offer: aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc<br>
ssh -c aes128-cbc AChen_NetAdmin@10.0.0.2<br><br>

*Create VLANs*<br>
vlan 10<br>
name VLAN10<br>
exit<br><br>

interface vlan 10<br>
ip address IP SUBNET_MASK<br>
no shutdown<br>
exit<br>

*Configure Access Lists*<br>
ip access-list extended ACCESS_LIST_NAME<br>
10 permit ip SOURCE_IP WILDCARD_MASK DEST_IP WILDCARD_MASK<br>
20 permit ip SOURCE_IP WILDCARD_MASK DEST_IP WILDCARD_MASK<br>
30 deny ip any any<br>
exit<br><br>