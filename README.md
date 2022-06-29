# About
This repository is a guide on how to open a minecraft java server on an android device, with root access.   
Using Termux to manage the server, Ngrok to share localhost, and Magisk to edit the host file.

## prerequisites
- A smartphone with at least 4Gb of ram
- [Magisk](https://github.com/topjohnwu/Magisk)-root solution for android devices
- [Termux](https://github.com/termux/termux-app)-a terminal for android devices
- [Ngrok](https://ngrok.com/download)-a solution to share your localhost
- [Minecraft_server.jar](https://www.minecraft.net/en-us/download/server)-file to open the server
## Starting
In termux you will need the following packages:
- openjdk17
- wget
```sh
pkg install openjdk-17 wget
pkg update 
```
Permission for termux to access internal and external memory
```sh
termux-setup-storage
```
## Setup Ngrok   
Be sure of your CPU architecture.   
If it is arm64 
```sh
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz
```
If it is arm 
```sh
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.tgz
```
After downloading, unpack with   
```sh
tar xvzf ~/ngrok-v3-stable-linux-arm"architecture".tgz
```
Add your ngrok authtoken
```sh
./ngrok config add-authtoken <token>
```
Ngrok installed
## Edit hosts file
In magisk settings enable systemless hosts and restart your smartphone   
Open termux and give root access permission
```sh
su
```
Edit the hosts file using text editor
```sh
nano /data/adb/modules/hosts/system/etc/hosts
```
Add these lines at the end of the file
```sh
8.8.4.4 dns.google.com
52.217.137.128 s3.amazonaws.com
3.136.132.147 tunnel.us.ngrok.com
54.161.241.46 update.equinox.io
```
> Note: you can change the ip's, just use a website to look up the ip from those DNS.
## Open minecraft server
Create a folder inside your internal memory and place the server.jar file in it   
Now with all the steps done, go back to termux

# Joining the server
Now just copy the ip that is in the ngrok tab, in the Forwarding line
> Example: 0.tcp.sa.ngrok.io:16040

You now have a minecraft server open