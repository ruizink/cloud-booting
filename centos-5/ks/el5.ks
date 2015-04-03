url --url=http://mirror.centos.org/centos-5/5.11/os/x86_64/
bootloader --location=mbr
zerombr
text
firewall --disabled
firstboot --disable
keyboard pt-latin1
lang en_US
logging --level=info
network --bootproto=dhcp --noipv6 device=eth0 --onboot=on

reboot
auth  --useshadow  --passalgo=sha512
# the highly secure root password is "password"
rootpw --iscrypted $6$HEYhIXmXDq2Ynl97$FHhjgDqs.3RNfr9GyzJIzz99Bl9L30L5YNStF9u0fUOR4hwbEeP3DAlwFboCx.w8ETI8PcKiNzrWt9fsZQBjv1
selinux --disable
skipx
timezone --isUtc Europe/Lisbon
install
clearpart --all --initlabel
part /boot --fstype=ext3 --size=200
part pv.01 --size=1 --grow
volgroup VolGroup00 --pesize=32768 pv.01
logvol swap  --fstype=swap --name=lv_swap --vgname=VolGroup00 --size=1024
logvol /     --fstype=ext4 --name=lv_root --vgname=VolGroup00 --size=2000 --grow

repo --name=vmware --baseurl=http://packages.vmware.com/tools/esx/latest/rhel5/x86_64/
repo --name=updates --baseurl=http://mirror.centos.org/centos-5/5.11/updates/x86_64/

%packages
@core
@base
-openldap
-bluez-gnome
-bluez-utils
-redhat-lsb
-nfs-utils
-yp-tools
-ypbind
-kexec-tools
-sendmail
-exim
-wireless-tools
-wpa_supplicant
-portmap
-cups
-sysreport
-yum-updatesd
-pcscd
-postfix
-cronie
-abrtd
-abrt
ntp
openssh-clients
yum
yum-metadata-parser
vim-enhanced
telnet
curl
httpd
vmware-tools-core
kmod-vmware-tools-vmxnet
kmod-vmware-tools-vmxnet3

%post
/sbin/chkconfig firstboot off
/sbin/chkconfig cups off
/sbin/chkconfig pcscd off
/sbin/chkconfig smartd off
/sbin/chkconfig yum-updatesd off
/sbin/chkconfig avahi-daemon off
/sbin/chkconfig avahi-dnsconfd off
/sbin/chkconfig cups off
/sbin/chkconfig netfs off
/sbin/chkconfig ip6tables off
/sbin/chkconfig iptables off
/sbin/chkconfig snmpd off
/sbin/chkconfig postfix off
/sbin/chkconfig sendmail off
/sbin/chkconfig httpd on
/sbin/chkconfig ntpd on
/sbin/chkconfig sshd on
