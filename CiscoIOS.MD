<!-- Show Environment -->
show env

<!-- Show device model and IOS version -->
show ver

<!-- Change Domain Name -->
config t
ip domain name yourdomain.com

<!-- Change Device Name -->
hostname NEW_HOSTNAME

<!-- Show RSA Key -->
show crypto key mypubkey rsa

<!-- Create new user, RSA key, and enable SSH -->
username new_user password new_password
ip ssh version 2
crypto key generate rsa

<!-- Delete users -->
no username user_to_delete

<!-- Save Config -->
write memory
copy run start

<!-- Show interface IP addresses and status -->
show ip int brief

<!-- Create DHCP Pools -->
ip dhcp pool POOL_NAME
network NETWORK_IP SUBNET_MASK
default-router IP
dns-server DNS1 DNS2 DNS3

ip dhcp excluded-address START_IP END_IP

<!-- SSH Sessions to older Cisco devices -->
Unable to negotiate with 10.0.0.2 port 22: no matching cipher found. Their offer: aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc
ssh -c aes128-cbc AChen_NetAdmin@10.0.0.2

<!-- Create VLANs -->
vlan 10
name VLAN10
exit

interface vlan 10
ip address IP SUBNET_MASK
no shutdown
exit

<!-- Configure Access Lists -->
ip access-list extended ACCESS_LIST_NAME
10 permit ip SOURCE_IP WILDCARD_MASK DEST_IP WILDCARD_MASK
20 permit ip SOURCE_IP WILDCARD_MASK DEST_IP WILDCARD_MASK
30 deny ip any any
exit

