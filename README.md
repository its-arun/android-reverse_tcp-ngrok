# Exploit Over WAN without Port Forwarding
This script enables users to use reverse_tcp exploits from metasploit over WAN without port forwarding.

You can change the payload according to your use case. I have made comments in the script to make it easier for you

## Usage

```
git clone https://github.com/its-arun/reverse_tcp-ngrok.git
cd reverse_tcp-ngrok
```
### Setup ngrok
1. Signup at https://ngrok.com/
2. Visit https://dashboard.ngrok.com/auth
3. Download ngrok for your OS from https://ngrok.com/download and place it in reverse_tcp-ngrok
4. Execute the given command in terminal
```
./ngrok authtoken <<auth_token>>
```

### Mac OSX
```
chmod +x mac.sh
./mac.sh
```
### Linux
```
chmod +x linux.sh
./linux.sh
```
