Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  
  config.vm.network "public_network"

  config.vm.provider :virtualbox do |v|
    v.gui = true
    v.memory = 2048
  end

  # Currently "ubuntu/bionic64" on VirtualBox requires `type: "virtualbox"`
  # to make synced folder works.
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  # Add Google Chrome repository
  config.vm.provision :shell, inline: "wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub|sudo apt-key add -"
  config.vm.provision :shell, inline: "sudo sh -c 'echo \"deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main\" > /etc/apt/sources.list.d/google.list'"

  # Update repositories
  config.vm.provision :shell, inline: "sudo apt update -y"

  # Upgrade installed packages
  config.vm.provision :shell, inline: "sudo apt upgrade -y"

  # Add desktop environment
  config.vm.provision :shell, inline: "sudo apt install -y --no-install-recommends ubuntu-desktop"
  config.vm.provision :shell, inline: "sudo apt install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11"
  
  # Add `vagrant` to Administrator
  config.vm.provision :shell, inline: "sudo usermod -a -G sudo vagrant"

  # Add Google Chrome
  config.vm.provision :shell, inline: "sudo apt install -y google-chrome-stable"

  # Add xrdp
  config.vm.provision :shell, inline: "sudo apt install -y xrdp"
  config.vm.provision :shell, inline: "sudo rm -f -R /usr/share/polkit-1/actions/org.freedesktop.color.policy"

  # Add terraform
  config.vm.provision :shell, inline: "sudo apt install -y wget"
  config.vm.provision :shell, inline: "rm -f -R terraform"
  config.vm.provision :shell, inline: "wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip"
  config.vm.provision :shell, inline: "unzip terraform_0.14.7_linux_amd64.zip"
  config.vm.provision :shell, inline: "sudo mv -f terraform /bin"

  # Add VS Code
  config.vm.provision :shell, inline: "sudo apt install -y snapd"
  config.vm.provision :shell, inline: "sudo snap install code --classic"
  
  # Add PGAdmin
  config.vm.provision :shell, inline: "sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add"
  config.vm.provision :shell, inline: "sudo sh -c 'echo \"deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main\" > /etc/apt/sources.list.d/pgadmin4.list && apt update'"
  config.vm.provision :shell, inline: "sudo apt update -y"
  config.vm.provision :shell, inline: "sudo apt install -y pgadmin4"
  config.vm.provision :shell, inline: "git clone https://github.com/MatthewRawling/vagrant.git"
  
  # Add MySQL Workbench
  config.vm.provision :shell, inline: "sudo apt install -y mysql-workbench"
  
  # Restart
  config.vm.provision :shell, inline: "sudo shutdown -r now"
end
