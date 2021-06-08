#!/bin/sh

#move the network interface ens224 from firewalld's public zone to internal zone
sudo firewall-cmd --permanent --zone=internal --change-interface=ens224

#Installing nfs-util
#sudo yum -y install nfs-utils

#sudo systemctl enable nfs-server rpcbind
#sudo systemctl start nfs-server

#Making /nfs-pub directory
#sudo mkdir /nfs-pub

#Changing the permission on /nfs-pub
#sudo chmod 777 /nfs-pub

#sudo chmod +t /nfs-pub

#echo "/nfs-pub 192.168.17.2(rw,root_squash)" >> /etc/exports 
#echo "/nfs-pub 192.168.17.4(rw,root_squash)" >> /etc/exports

#exportfs -a

#update firewalld internal zone to allow nfs service
sudo firewall-cmd --zone=internal --add-service=nfs --permanent
sudo firewall-cmd --zone=internal --add-service={nfs3,mountd,rpc-bind} --permanent
sudo systemctl restart firewalld
