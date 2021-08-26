------------------------------------------------------------
PRIMEIROS PASSOS
------------------------------------------------------------
sudo apt-get update
sudo apt-get upgrade

------------------------------------------------------------
Check Hardware Information on Linux
https://www.binarytides.com/linux-commands-hardware-info/
------------------------------------------------------------
# Linux version
cat /etc/os-release

# lscpu - The lscpu command reports information about the cpu and processing units
lscpu

# lshw - List Hardware
sudo lshw -short

# hwinfo - Hardware Information
# sudo apt-get install hwinfo
hwinfo --short

# lspci - List PCI
lspci

# lsscsi - List scsi devices
# sudo apt-get install lsscsi
lsscsi

# lsusb - List usb buses and device details
lsusb

# Inxi is a 10K line mega bash script that fetches hardware details from multiple different sources and commands on the system
# sudo apt-get install inxi
inxi -Fx

# lsblk - List block devices
lsblk

# df - disk space of file systems
df -H

------------------------------------------------------------
PROCESS
------------------------------------------------------------
# kill process
kill PID

# start background job
nohup [command]
nohup ruby script.rb &

# list background job
jobs

# list all the running processes
ps -ef
ps -ef | grep nohup
ps -ef | grep miner

# OR
ps -aux
ps -aux | grep miner

# O comando top é outro método altamente recomendado para ver o uso de recursos de seus servidores Linux. Pode-se ver uma lista dos principais processos que usam mais memória, CPU ou disco.
top
sudo top
sudo top [options]

# O comando htop é um visualizador de processo interativo
htop
sudo htop
sudo htop [options]