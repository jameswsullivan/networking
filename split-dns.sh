# Configure a separate DNS view for internal traffic:
ip dns view internal-view
domain list mydomain.local
domain name-server <DC-01s-IP-Address>
domain name-server <DC-02s-IP-Address>
exit

# Configure the default view to use for general internet traffic:
ip dns view default
domain name-server 1.1.1.1
domain name-server 8.8.8.8
exit
# or, use your ISP's DNS servers.

# Define a DNS name-list for your internal network's domain (e.g. mydomain.local):
ip dns name-list 100 permit .*.mydomain.local

# Define a DNS view-list called SPLITDNS, and assign the views with their appropriate evaluation order (10 and 99):
ip dns view-list SPLITDNS
view internal-view 10
restrict name-group 100
view default 99

# Enable DNS server:
ip dns server
ip dns server view-group SPLITDNS


# Troubleshooting:

# Enable debug:
debug ip dns view
debug ip dns view-list
debug ip dns name-list

terminal monitor

# View configured DNS views:
show ip dns view
show ip dns view-list
show ip dns name-list

# Test name resolution with nslookup :
nslookup -type=ns myapp.mydomain.local
nslookup -type=ns www.google.com