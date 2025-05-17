# DIGLIST.sh
`diglist.sh` will take a file of targets you provide and use dig to fetch whatever DNS records you want. The list of targets should be a file containing a newline-separated list of IP addresses and/ or domain names. `diglist.sh` will also ask you for a DNS record type which can be anything supported by dig's `-t` flag (any, a, aaaa, txt, n, mx, etc...)

If you want to dig a single target... then just use dig lol.

## USE
```bash
bash diglist.sh <file with whitespace-separated IPs or domain names> <root domain> <DNS record type>
```

### OR
Let diglist prompt you for the file and record type:
```markdown
└─# bash diglist.sh

                     :-- DIGLIST.SH: Gather DNS Records for multiple targets --:

:-- Enter a file to use which contains newline separated IP addresses and/ or hostnames:
digme
:--  What record type are you looking for? (ex: txt, any, a, n, aaaa):
any
:-- Digging digme for any record types...

_________________________ google.com _________________________
:-- RESULT:
; <<>> DiG 9.10.6 <<>> google.com any
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 40037
;; flags: qr rd ra; QUERY: 1, ANSWER: 16, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4095
;; QUESTION SECTION:
;google.com.			IN	ANY

;; ANSWER SECTION:
google.com.		22	IN	SOA	ns1.google.com. dns-admin.google.com. 759538996 900 900 1800 60
google.com.		298	IN	AAAA	2607:f8b0:4023:100b::64
google.com.		298	IN	AAAA	2607:f8b0:4023:100b::8a
google.com.		298	IN	AAAA	2607:f8b0:4023:100b::65
google.com.		298	IN	AAAA	2607:f8b0:4023:100b::71
google.com.		276	IN	A	142.251.186.102
google.com.		276	IN	A	142.251.186.100
google.com.		276	IN	A	142.251.186.138
google.com.		276	IN	A	142.251.186.113
google.com.		276	IN	A	142.251.186.139
google.com.		276	IN	A	142.251.186.101
google.com.		14864	IN	TYPE65	\# 13 00010000010006026832026833
google.com.		144466	IN	NS	ns2.google.com.
google.com.		144466	IN	NS	ns4.google.com.
google.com.		144466	IN	NS	ns1.google.com.
google.com.		144466	IN	NS	ns3.google.com.

;; Query time: 14 msec
;; SERVER: 100.100.100.100#53(100.100.100.100)
;; WHEN: Sat May 17 11:12:21 PDT 2025
;; MSG SIZE  rcvd: 390

_________________________ -x 1.1.1.1 _________________________
:-- RESULT:
; <<>> DiG 9.10.6 <<>> -x 1.1.1.1 any
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 3581
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4095
;; QUESTION SECTION:
;1.1.1.1.in-addr.arpa.		IN	ANY

;; ANSWER SECTION:
1.1.1.1.in-addr.arpa.	1252	IN	PTR	one.one.one.one.

;; Query time: 13 msec
;; SERVER: 100.100.100.100#53(100.100.100.100)
;; WHEN: Sat May 17 11:12:21 PDT 2025
;; MSG SIZE  rcvd: 78

_________________________ -x 8.8.8.8 _________________________
:-- RESULT:
...
```
