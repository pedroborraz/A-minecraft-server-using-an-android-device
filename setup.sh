#!/bin/bash

echo "setup prerequisites?[y/n]"
read -r in
lowerin=$(echo "$in" | tr '[:upper:]' '[:lower:]')
case $lowerin in
y)
    echo "starting..." 
    sleep 1
    pkg install openjdk-17 wget
    pkg update
    echo "installed packages"
    sleep 2
    echo "permission to access device memory"
    termux-setup-storage
    sleep 1
    echo "downloading ngrok..."
    arch=$(uname -m)
    case $arch in
    aarch64)
        archURL="arm64" ;;
    arm)
        archURL="arm" ;;
    *)
        echo "unknown or unsupported architecture"
        archURL=0
    esac
    
    if [ "$archURL" != 0 ];then 
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-${archURL}.tgz
    tar xvzf ngrok-v3-stable-linux-${archURL}.tgz
    rm ngrok-v3-stable-linux-${archURL}.tgz
    chmod 700 ngrok
    mv ngrok /data/data/com.termux/files/usr/bin/
    sleep 2
    echo "your ngrok authtoken"
    read -r token
    ngrok config add-authtoken "${token}"
    echo "ngrok successfully installed"
    sleep 2
    echo "if you want to edit your authtoken use nano ~/.config/ngrok/ngrok.yml"
    sleep 1
    echo "to use ngrok use ngrok command";
    else
    echo "stopping..."
    fi

;;
n)
    echo "stopping..." ;;
*)
    echo "invalid option" 
esac
