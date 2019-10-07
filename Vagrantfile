IMAGE_NAME = "geerlingguy/ubuntu1604"
N = 1

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
		#config.vm.synced_folder ".", "/vagrant" , type: "nfs"
		#config.vm.synced_folder "./data", "/mnt/data" , type: "nfs"


    end
      
    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
	    master.vm.network "forwarded_port", guest: 30800, host: 80
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.hostname = "k8s-master"
        master.vm.provision "ansible_local" do |ansible|
            ansible.playbook = "kubernetes-setup/master-playbook.yaml"
            ansible.extra_vars = {
                node_ip: "192.168.50.10",
            }
        end
            master.vm.provision "shell" do |s|
          s.path = "src/apply.sh"
		  s.privileged = false
        end
    end

    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            node.vm.hostname = "node-#{i}"
            node.vm.provision "ansible_local" do |ansible|
                ansible.playbook = "kubernetes-setup/node-playbook.yaml"
                ansible.extra_vars = {
                    node_ip: "192.168.50.#{i + 10}",
                }
            end
          node.vm.provision "shell" do |s|
          s.path = "src/build.sh"
        end
      end
    end
end

