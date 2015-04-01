bootloader --location=mbr
zerombr
text
firewall --disabled
firstboot --disable
keyboard pt-latin1
lang en_US
logging --level=debug
network --bootproto=dhcp
url --url http://mirror.centos.org/centos-6/6.6/os/x86_64/
reboot
auth  --useshadow  --passalgo=sha512
# the highly secure root password is "password" 
rootpw --iscrypted $6$HEYhIXmXDq2Ynl97$FHhjgDqs.3RNfr9GyzJIzz99Bl9L30L5YNStF9u0fUOR4hwbEeP3DAlwFboCx.w8ETI8PcKiNzrWt9fsZQBjv1
selinux --disable
skipx
timezone UTC
install
clearpart --all --initlabel 
part /boot --fstype=ext4 --size=100
part pv.01 --size=1 --grow
volgroup VolGroup00 --pesize=32768 pv.01
logvol swap  --fstype=swap --name=lv_swap --vgname=VolGroup00 --size=1024
logvol /     --fstype=ext4 --name=lv_root --vgname=VolGroup00 --size=5000 --grow

%packages --nobase 
@core
openssh-clients
sudo
%end


