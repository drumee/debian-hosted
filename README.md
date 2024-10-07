# Installation on bare metal or Virtual Machine 
This packae is dedicated to Debian Distribution Targets only

## Dependencies
- nginx
- mariadb
- prosody
- jitsi-meet
- nodejs
- bind9
- graphicsmagick
- ffmpeg
- redis
- libreoffice
- postfix
- opendkim

## Prerequisite
### Settings
- A maiden Internet domain name
- Control Access to your DNS zone
- Control Access to your GLU DNS
- At least one Public IP addresses, IPV4 and/or IPV6
- Debian 11 or higher

### Hardware
- RAM at least 8Go
- CPU at leat 2 GHz
- Enough space to host what you need

### Recommandations
- Drumee should be installed on a dedicated disks or partitions
- MFS (/data) should be not installed on the same partition as server (/srv)
- If you expect high rate of read/write operations, database base partition (/srv/db) should be installed on a high speed disk or partition, ie. SSD or NVMe 

### Caution
- The provided domain name can noyt be shared with existing or futur application
- It is recommanded not to share DB server with any other application

## Installation 
### Prepare your ISP settings

#### Prepare you IP addresses
This task depends on your Domain Name Provider. Replace *example.org* by your own domain name. If you don't have IP V6 address, just fill in IPV4 fields.
The purpose of this task to bind your domain name to the Ip Address of your Drumee Server. 

In th DNS zone, remove all existing DNS records. Then, create following records in your Domain Name Provider:

  | Domain Name      |  Type  | Target             |
  |------------------|--------|--------------------|
  | example.org      | A      | your.ip.4.address  |
  | example.org      | AAAA   | your.ip.6.address  |
  | ns1.example.org  | A      | your.ip.4.address  |
  | ns1.example.org  | AAAA   | your.ip.6.address  |
  | ns2.example.org  | A      | your.ip.4.address  |
  | ns2.example.org  | AAAA   | your.ip.6.address  |

#### Change the default Domain Name Server (DNS)
This section will replace your ISP DNS by the one that run on your own Synology NAS. To make this effective, open your ISP interface and change current Name Servers to ns1.example.org and ns2.example.org

#### Change your GLUE DNS
Open your ISP interface and add following entries:
- ns1.example.org 
- ns2.example.org

Wait the change to take effects.

#### Check your DNS records

Open a Shell Terminal and run

```console
nslookup example.org
```

If everything is OK, you should see response like below.

Server:		192.168.5.1
Address:	192.168.5.1#53

Non-authoritative answer:
Name:	example.org
Address: *your.ip.4.address*
Name:	example.org
Address: *your.ip.4.address*


### Prepare your settings 

```console
git clone https://github.com/drumee/debian-hosted.git
```

```console
cd debian-hosted
```

```console
cp env.sh drumee.sh
```

- Use your favorite editor to change values in the file *drumee.sh* accordingly to your setup. 
- Save the changes. 
- Check that GLUE records has been updated.

**Ensure changes on your Internet Access Provider has been updated.**

**Ensure directories (DRUMEE_DB_DIR, DRUMEE_DATA_DIR) exist and have enough space**

*Following command must be executed as root user i.e su, not sudo*
```console
./install --env-file=drumee.sh
```
