#!/bin/bash

echo "Setup prerequisites?[y/n]"
read -r in
lowerin=$(echo "$in" | tr '[:upper:]' '[:lower:]')
case $lowerin in
y)
    echo "starting..." 
    #pkg install openjdk-17 wget
    #pkg update
    echo "installed packages."
    echo "permission to access device memory"
    #termux-setup-storage
    echo "Downloading ngrok..."
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
    echo "your ngrok authtoken"
    read -r token
    ./ngrok config add-authtoken "${token}"
    echo "ngrok successfully installed";
    else
    echo "stopping..."
    fi

;;
n)
    echo "stopping..." ;;
*)
    echo "invalid option" 
esac
