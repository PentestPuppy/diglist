# DIGLIST.sh

## USE
```bash
bash diglist.sh <file with whitespace-separated IPs or domain names> <DNS record type>`
```
### OR
Let dig list prompt you for the file and record type:
```bash
% bash diglist.sh

              :-- DNS RECORDS --:

:-- Enter a file to use which containes new line separated IP addresses and/ or hostnames:
list.txt
:-- What record type are you looking for? (ex: 'txt'):
any
:-- Digging test.txt for any record types...
_________________________ 8.8.8.8 _________________________
:--RESULT:
; <<>> DiG 9.10.6 <<>> 8.8.8.8 any
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOTIMP, id: 21998
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 0

;; WARNING: EDNS query returned status NOTIMP - retry with '+noedns'

;; QUESTION SECTION:
;8.8.8.8.                       IN      ANY

;; Query time: 39 msec
;; SERVER: 100.100.100.100#53(100.100.100.100)
...
```
