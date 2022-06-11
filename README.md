# About
This repository is a guide on how to open a minecraft java server on an android device, with root access.   
Using Termux to manage the server, Ngrok to share localhost, and Adaway to edit the host file.
> Note: for good performance I recommend a smartphone with at least 4Gb of ram

## You can find the termux, ngrok and adaway respectively at these links:
- [Termux](https://github.com/termux/termux-app)
- [Ngrok](https://ngrok.com/download)
- [Adaway](https://github.com/AdAway/AdAway)
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
- make sure you have root access through magisk.
- in magisk settings, enable the option of Systemless Hosts, and restart your smartphone.
- after restarting, open Adaway and use the root method, give root permission and complete the setup. 
      
Now with Adaway installed, go to **preferences > root-based blocker > open hosts file**   
Add these DNS in the last line:
```sh
8.8.4.4 dns.google.com
52.217.137.128 s3.amazonaws.com
3.136.132.147 tunnel.us.ngrok.com
54.161.241.46 update.equinox.io
```
> Note: you can change the addresses, just use a website to look up the DNS from those urls.
## Setup Ngrok
Going back to termux, use the command:
> Note: Be sure of your CPU architecture. If it is arm64 the command will be as follows
```sh
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz
```
> Note: if it is arm the command will be as follows
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
