#!/bin/sh

# Firewall Setup
cat > /etc/rc.local <<XOK
#!/bin/bash

ufw --force enable
ufw default deny incoming
ufw default deny outgoing
ufw allow ssh
ufw allow 514/tcp
ufw allow 514/udp

ufw allow out 4041/tcp
ufw allow out 443/tcp
ufw allow out 123/tcp
ufw allow out 22/tcp
ufw allow out 80/tcp
ufw allow out 53/tcp
ufw allow out 53/udp
ufw allow out 123/udp

XOK
chmod a+x /etc/rc.local

# Add Sudoer user

useradd colladmin
echo -e 'insecure\ninsecure' | passwd colladmin
echo "colladmin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# NTP setup
sed -i -e 's/^pool/\# pool/' /etc/ntp.conf
echo 'server time.nist.gov' >> /etc/ntp.conf

# sysctl setup
cat >> /etc/sysctl.conf <<XOK 
net.core.somaxconn = 1024
net.ipv4.ip_local_port_range = 2048 65535
net.ipv4.tcp_fin_timeout = 30
net.ipv4.icmp_echo_ignore_broadcasts = 1 
net.ipv4.conf.all.log_martians = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
fs.file-max = 100000
XOK


# Mount /tmp with noexec,nosuid
echo "tmpfs   /tmp    tmpfs       nosuid,noexec   0 0" >> /etc/fstab

# Install Security Packages

apt install -y --no-install-recommends checksecurity debsecan tiger


