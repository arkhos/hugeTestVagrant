VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #Avoid vagrant issue 5199 - https://github.com/mitchellh/vagrant/issues/5199#issuecomment-70603756
  #Execute in terminal: rm .vagrant/machines/default/virtualbox/synced_folders; vagrant reload

  config.vm.box = 'ubuntu/trusty64'
  
  config.vm.network :forwarded_port, guest: 8080, host: 8080  

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'keystoneDemoWithProxy'
  end

end
