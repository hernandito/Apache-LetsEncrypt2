
![apache-le](https://raw.githubusercontent.com/hernandito/Apache-LetsEncrypt/master/apache_logo_medium_copy.png)


Based on LinuxServer.io's Apache Docker, this Docker add LetsEncrypt SSL Certificate generation and renewal. All the hard work and merits go to the LinuxServer team.

This is an apache web server docker with reverse proxy services enabled.  Reverse proxy gives the ability going to www.domain.com:8351 for a service, you can go direct to www.domain.com/service and also enable HTTPS.

[![apache](http://www.softaculous.com/website/images/ampps/apache.png)][apacheurl]
[apacheurl]: https://httpd.apache.org/

## Usage

```
docker create \
--name="apache" \
-p 80:80 -p 443:443 \
-v /path/to/config:/config \
linuxserver/apache
```

**Parameters**

* `-p 80, 443` - the port(s)
* `-v /config/` - Location for reverse proxy files. Contains log, www, keys and apache folder
* `-e PGID` for for GroupID - see below for explanation - *optional*
* `-e PUID` for for UserID - see below for explanation - *optional*

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it apache /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 

* Config files are located in /config/apache
* Place web files in /config/www
* Place keys in /config/keys

## Updates

* Upgrade to the latest version simply `docker restart apache`.
* To monitor the logs of the container in realtime `docker logs -f apache`.


**Versions**

* 09-09-16 - Add layer badges to README.
* 06-11-15 - Initial Release
