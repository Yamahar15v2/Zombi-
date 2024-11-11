#!/bin/bash
set -e
echo "Updating package list..."
sudo apt update
if ! command -v go &> /dev/null; then
    echo "Installing Go..."
    sudo apt install -y golang-go
else
    echo "Go is already installed."
fi
if [ ! -f go.mod ]; then
    echo "Initializing Go module..."
    go mod init ranbal-telegram-bot
else
    echo "Go module already initialized."
fi
echo "Installing Telegram Bot API package..."
go get -u github.com/go-telegram-bot-api/telegram-bot-api
chmod +x *
echo "Setup completed successfully!"
