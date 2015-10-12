
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'


Vagrant.configure("2") do |config|
  config.vm.provider "docker" do |d|
    d.build_dir = "."
  end
  config.vm.network "forwarded_port", guest: 6311, host: 6311
  config.vm.synced_folder "logs", "/tmp/logs"
end
