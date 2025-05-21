#!/bin/bash
sudo apt update -y
sudo apt install -y nodejs npm
git clone https://github.com/<your-username>/aws-ci-cd-node-app.git
cd aws-ci-cd-node-app/app
npm install
node server.js &
