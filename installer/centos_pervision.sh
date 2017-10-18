#!/bin/bash

update_resolv_conf() {
cat > resolv.conf <<EOF
nameserver 114.114.114.114
nameserver 119.29.29.29
EOF
sudo mv resolv.conf /etc
}

install_chinese_support() {
    sudo yum install -y wqy-microhei-fonts
}

main() {
    sudo yum install -y epel-release
    sudo yum update -y 
    update_resolv_conf 
    install_chinese_support
}

main
