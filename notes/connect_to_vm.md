# Commands to connect to the vm
To connect from this env.

```sh
chmod 400 /opt/notebooks/data_enginering_machine.pem
ssh -i /opt/notebooks/data_enginering_machine.pem ubuntu@3.251.108.45
```

## Copy file from the VM

May be to upload your exam on the Learn platform
```sh
scp -i /opt/notebooks/data_enginering_machine.pem ubuntu@3.251.108.45:/home/ubuntu/linux_bash/mon-fichier.md /opt/notebooks/
```