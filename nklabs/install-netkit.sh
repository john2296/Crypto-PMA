#!/bin/bash
# Download and install netkit-ng in home directory
# Peter Norris: 11 Oct 2017

cd ~

wget https://github.com/netkit-ng/netkit-ng-core/releases/download/3.0.4/netkit-ng-core-32-3.0.4.tar.bz2

wget https://github.com/netkit-ng/netkit-ng-build/releases/download/0.1.3/netkit-ng-kernel-i386-K3.2-0.1.3.tar.bz2

wget https://github.com/netkit-ng/netkit-ng-build/releases/download/0.1.3/netkit-ng-filesystem-i386-F7.0-0.1.3.tar.bz2

for i in netkit-ng*.tar.bz2; do tar -xvjSf $i; done

cat >> ~/.bashrc <<EOF

# additions for netkit-ng
export NETKIT_HOME="$HOME/netkit-ng"
export MANPATH=":\$NETKIT_HOME/man"
export PATH="\$PATH:\$NETKIT_HOME/bin"
EOF

sudo apt-get update && sudo apt-get install libc6-i386 wireshark

echo $(source ~/.bashrc && cd $NETKIT_HOME && ./check_configuration.sh)


