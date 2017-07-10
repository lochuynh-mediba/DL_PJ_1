# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
  end

  # ローカルバッチサーバー
  config.vm.define "dl_local_batch01" do |node2|

    node2.vm.box = "box-cutter/centos72"
    node2.vm.hostname = "local-dl-batch01"
    node2.vm.network :private_network, ip: "192.168.33.94"

    # node2.vm.synced_folder ".", "/vagrant", :owner=>"vagrant", :group=>"vagrant", :mount_options => ["dmode=777", "fmode=775"]
    node2.vm.synced_folder ".", "/vagrant", :owner=>"dl-batch", :group=>"dl-batch", :mount_options => ["dmode=777", "fmode=775"]

    node2.vm.provision "ansible" do |ansible2|
      ansible2.playbook = "ansible/playbooks/local_dl_batch.yml"
      ansible2.inventory_path = "ansible/hosts/local"
      ansible2.limit = "dl_batch"
      ansible2.raw_arguments = ["-v", "-u vagrant"]
    end
  end
end
