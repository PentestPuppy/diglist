# DIGLIST.sh

## USE
```bash
bash diglist.sh <file with whitespace-separated IPs or domain names> <root domain> <DNS record type>
```
### OR
Let diglist prompt you for the file, root domain, and record type:
```markdown
└─# bash diglist.sh
                     :-- DNS RECORDS --:

:-- Enter a file to use which containes new line separated IP addresses and/ or hostnames:
list.txt
:-- Enter the root domain:
google.com
:-- What record type are you looking for? (ex: txt, all, a, n, aaaa):
all

:-- Digging list.txt for all record types...

_________________________ www.google.com _________________________
:-- RESULT:
;; <<>> DiG 9.19.19-1-Debian <<>> www.google.com all
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 34658
;; flags: qr rd ra; QUERY: 1, ANSWER: 6, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;www.google.com.			IN	A

;; ANSWER SECTION:
www.google.com.		47	IN	A	64.233.180.106
www.google.com.		47	IN	A	64.233.180.104
www.google.com.		47	IN	A	64.233.180.99
www.google.com.		47	IN	A	64.233.180.147
www.google.com.		47	IN	A	64.233.180.103
www.google.com.		47	IN	A	64.233.180.105

;; Query time: 0 msec
;; SERVER: 172.31.0.2#53(172.31.0.2) (UDP)
;; WHEN: Thu Jan 23 20:16:55 EST 2025
;; MSG SIZE  rcvd: 139

;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 7429
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;all.				IN	A

;; AUTHORITY SECTION:
.			3276	IN	SOA	a.root-servers.net. nstld.verisign-grs.com. 2025012301 1800 900 604800 86400

;; Query time: 0 msec
;; SERVER: 172.31.0.2#53(172.31.0.2) (UDP)
;; WHEN: Thu Jan 23 20:16:55 EST 2025
;; MSG SIZE  rcvd: 107
_________________________ ftp.google.com _________________________
:-- NO RESULTS for ftp.google.com
_________________________ admin.google.com _________________________
:-- RESULT:
; <<>> DiG 9.19.19-1-Debian <<>> admin.google.com all
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 11189
;; flags: qr rd ra; QUERY: 1, ANSWER: 6, AUTHORITY: 0, ADDITIONAL: 1

... snip ...
                     :-- DONE --:
```
