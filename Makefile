# Make sure you have:
# Launchad your VM
# downloaded your *.pem file to your local machine
# Installed VS-code
# INstalled Remote - SSH or SSH FS extension in VS-code

build:
	docker compose up --build

install-make:
	sudo apt update; sudo apt install make
	
# Install Python3 and pip3 on your local machine
install-python-pip-curl-git-wget:
	sudo apt-get update
	sudo apt install python3
	sudo apt-get install python3-pip
	sudo apt-get install curl
	sudo apt-get install git
	sudo apt-get install wget
	sudo apt-get install lsof

# connection to the VM using SSH
#vm-connect:
#	chmod 400 data_enginering_machine.pem
#	ssh -i data_engineer_machine_key.pem ubuntu@3.251.108.45

# Define variables
PEM_FILE = vm_keys/data_engineering_machine.pem
IP_ADDRESS = 34.240.6.168
FILE_PATH_ON_VM = /home/ubuntu/masterclass/tooling_ds/mon-fichier.md
REMOTE_FILE_PATH = /home/ubuntu/masterclass/tooling_ds/
LOCAL_FILE_PATH = ./my_local_file.md

# connection to the VM using SSH : sudo chmod 400 $(PEM_FILE)
vm-connect:
	ssh -i $(PEM_FILE) ubuntu@$(IP_ADDRESS)

# copy file from the VM to local machine
# You need to execute this command from the local machine
copy-file-from-vm:
	scp -i $(PEM_FILE) ubuntu@$(IP_ADDRESS):$(FILE_PATH_ON_VM) .

# Copy file from local machine to VM
copy-file-to-vm:
	scp -i $(PEM_FILE) $(LOCAL_FILE_PATH) ubuntu@$(IP_ADDRESS):$(REMOTE_FILE_PATH)

# download file with wget
get-file:
	wget --no-cache https://dst-de.s3.eu-west-3.amazonaws.com/bash_fr/api.tar
	tar -xvf api.tar
	chmod +x api

launch-api:
	./api &