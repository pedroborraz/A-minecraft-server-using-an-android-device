# About
This repository is a guide on how to open a minecraft java server on an android device, with root access.   
Using Termux to manage the server, Ngrok to share localhost, and Adaway to edit the host file.

## prerequisites
- A smartphone with at least 4Gb of ram
- [Magisk](https://github.com/topjohnwu/Magisk)-root solution for android devices
- [Termux](https://github.com/termux/termux-app)-a terminal for android devices
- [Ngrok](https://ngrok.com/download)-a solution to share your localhost
- [Adaway](https://github.com/AdAway/AdAway)-app that lets you modify the hosts file
- [Minecraftserver.jar](https://www.minecraft.net/en-us/download/server)-link to download the file to open the server
## Starting
In termux you will need the following packages:
- tmux
- openjdk17
- wget
```sh
pkg install tmux openjdk-17 wget
pkg update 
pkg upgrade
```
Permission for termux to access internal and external memory
```sh
termux-setup-storage
```
## Using Adaway
1. Make sure you have root access through magisk.
2. In magisk settings, enable the option of Systemless Hosts, and restart your smartphone.
3. After restarting, open Adaway and use the root method, give root permission and complete the setup. 
      
Now with Adaway installed, go to **preferences > root-based blocker > open hosts file**   
> Note: you will need a text editor with root access      

Add these DNS in the last line:
```sh
8.8.4.4 dns.google.com
52.217.137.128 s3.amazonaws.com
3.136.132.147 tunnel.us.ngrok.com
54.161.241.46 update.equinox.io
```
> Note: you can change the addresses, just use a website to look up the DNS from those urls.
## Setup Ngrok
Going back to termux:   
 Be sure of your CPU architecture. If it is arm64 the command will be as follows
```sh
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz
```
If it is arm the command will be as follows
```sh
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.tgz
```
After downloading, unpack with the command:   
```sh
tar xvzf ~/ngrok-v3-stable-linux-arm"architecture".tgz
```
Add your ngrok authtoken
```sh
./ngrok config add-authtoken <token>
```
Ngrok installed
## Open minecraft server
Create a folder inside your internal memory and place the server's .jar file in it   
Now with all the steps done, go back to termux and let's use two terminal tabs   
Start tmux:
```sh
tmux
```
Split the terminal horizontally using:   
> **CTRL+b+"**   

By touching the area of one of the terminals, start ngrok, using the tcp protocol, on the standard minecraft port:
```sh
./ngrok tcp 25565
```
In the other terminal area, let's start the minecraft server   
Let's go to the folder where the .jar file is:
```sh
cd /storage/shared/"serverfolder"
```
Start the server with the standard minecraft website command:
```sh
java -Xmx1024M -Xms1024M -jar minecraft_server.1.19.jar nogui
```
1. The server will automatically close for you to accept the EULA terms   
2. Just open the eula.txt file and edit the line containing false to true
3. Re-enter the command in termux to start the server
```sh
java -Xmx1024M -Xms1024M -jar minecraft_server.1.19.jar nogui
```
Now the server will start correctly
> Note: you can edit the server.properties file and change the settings to your liking
# Joining the server
Now just get the ip that is in the ngrok tab, in the Forwarding line
> Example: 0.tcp.sa.ngrok.io:16040

You now have a minecraft server open
