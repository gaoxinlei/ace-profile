# encoding: utf-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ace-box"
  # 考虑到网速问题, 务必提前下载镜像文件,并保存在当前目录
  config.vm.box_url = "./package.box"

  config.vm.synced_folder ".", "/vagrant", disabled: true

  [8080, 80].each do |port|
    if port <= 1024 then port += 10000 end
    config.vm.network :forwarded_port, guest: port, host: port
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 1
  end
end
