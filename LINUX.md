------------------------------------------------------------
### FIRST STEPS
------------------------------------------------------------

```bash
sudo apt-get update
sudo apt-get upgrade
```

------------------------------------------------------------
### Check Hardware Information on Linux - [linux-commands-hardware-info](https://www.binarytides.com/linux-commands-hardware-info/)
------------------------------------------------------------

* Linux version
```bash
cat /etc/os-release
```

* lscpu - The lscpu command reports information about the cpu and processing units
```bash
lscpu
```

* lshw - List Hardware
```bash
sudo lshw -short
```

* hwinfo - Hardware Information
```bash
sudo apt-get install hwinfo
hwinfo --short
```

* lspci - List PCI
```bash
lspci
```

* lsscsi - List scsi devices
```bash
sudo apt-get install lsscsi
lsscsi
```

* lsusb - List usb buses and device details
```bash
lsusb
```

* Inxi is a 10K line mega bash script that fetches hardware details from multiple different sources and commands on the system
```bash
sudo apt-get install inxi
inxi -Fx
```

* lsblk - List block devices
```bash
lsblk
```

* df - disk space of file systems
```bash
df -H
```

------------------------------------------------------------
### PROCESS
------------------------------------------------------------

* kill process
```bash
kill PID
```

* start background job
```bash
# nohup [command]
nohup ruby script.rb &
```

* list background job
```bash
jobs
```

* list all the running processes
```bash
ps -ef
ps -ef | grep nohup
ps -ef | grep miner
```

* OR
```bash
ps -aux
ps -aux | grep miner
```

* O comando top é outro método altamente recomendado para ver o uso de recursos de seus servidores Linux. Pode-se ver uma lista dos principais processos que usam mais memória, CPU ou disco.
```bash
top
sudo top
# sudo top [options]
```

* O comando htop é um visualizador de processo interativo
```bash
htop
sudo htop
# sudo htop [options]
```
