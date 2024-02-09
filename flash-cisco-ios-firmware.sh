# Prerequisites:
# Switch Model: WS-C3750G-24PS-S
# Old firmware: c3750-advipservicesk9-mz.122-44.SE4.bin
# New firmware: c3750-ipservicesk9-mz.150-2.SE11.bin
# A TFTP Server at 192.168.0.100 . (I used SolarWinds TFTP Server here.)

# Verify current IOS version, view current IOS bin file.
show version
show switch
dir flash:
# Assuming that your switch only have one flash.

# Delete old IOS firmware file.
delete /f /r flash:c3750-advipservicesk9-mz.122-44.SE4.bin

# Copy new IOS firmware from TFTP server.
copy tftp flash
# Follow the prompts and provide server IP and file name.

# Configure and verify boot file.
show boot

config t
boot system switch all flash:/c3750-ipservicesk9-mz.150-2.SE11.bin
exit
show boot

# Apply changes and reload switch.
write memory
reload