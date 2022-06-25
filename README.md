# About
This repository is a guide on how to open a minecraft java server on an android device, with root access.   
Using Termux to manage the server, Ngrok to share localhost, and Magisk to edit the host file.

## prerequisites
- A smartphone with at least 4Gb of ram
- [Magisk](https://github.com/topjohnwu/Magisk)-root solution for android devices
- [Termux](https://github.com/termux/termux-app)-a terminal for android devices
- [Ngrok](https://ngrok.com/download)-a solution to share your localhost
- [Minecraft_server.jar](https://www.minecraft.net/en-us/download/server)-link to download the file to open the server
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
Going back to termux:   
 Be sure of your CPU architecture. If it is arm64 
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
## Open minecraft server
Create a folder inside your internal memory and place the server.jar file in it   
Now with all the steps done, go back to termux

# Joining the server
Now just get the ip that is in the ngrok tab, in the Forwarding line
> Example: 0.tcp.sa.ngrok.io:16040

You now have a minecraft server open
