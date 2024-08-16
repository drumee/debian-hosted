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
- Control Access to GLU DNS of the Internet domain
- At least one Public IP addresses, IPV4 and/or IPV6
- Docker Engine version 20 or higher
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
Open your provider's DNS manager.
- In th DNS zone, remove all existing DNS records
- Add records A and AAAA (if any) to your domain name
- Add records A and AAAA to ns1.your.domain and ns2.your.domain 
- Change the GLUE records of your DNS registry as follows: 
* ns1.your.domain <---> IP4,IP6
* ns2.your.domain <---> IP4,IP6
- Change to name servers fo your domain to ns1.your.domain and ns2.your.domain
Wait the change to take effects. 

```console
git clone https://github.com/drumee/debian-install.git
```

```console
cd debian-install
```

```console
cp env.sh my-setup.sh
```

- Use your favorite editor to change values in the file *my-setup.sh* accordingly to your setup. 
- Save the changes. 
- Check that GLUE records has been updated.

**Ensure changes on your Internet Access Provider has been updated.**

**Ensure directories (DRUMEE_DB_DIR, DRUMEE_DATA_DIR) exist and have enough space**

*Folling command must be executed as root user i.e su, not sudo"*
```console
./install --env-file=my-setup.sh
```
