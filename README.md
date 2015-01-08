hosts
=====

## Usage
You can replace hosts file to your local hosts file on your system.

 - windows

   C:\Windows\System32\Drivers\etc

 - Linux

   /etc/hosts


## ip

There are 3 ip addresses could be used , every one work well . There are have some difference also , if have any APACHE server or some other server on your system , so maybe 127.0.0.1 is no a good choice for you .

 - 127.0.0.1
 - 127.1
 - 0.0.0.0

## config-ads-list
All the ads relatived domain will be listed in the file , all the domains will point to 127.0.0.1 . 

## config-google-ip
This is a file that listed all maybe enable ip address for google services , the hosts.sh will read this file and get the first line , and point all google service domains to this ip address.

## config-google-list
All the google service relatived domain will be listed in this file , they will point to a ip address which provided on config-google-ip file .
