<h2>WHM Email Security & Anti-Spam Command Cheat Sheet</h2>

Mail Queue Management.\
`exim -bp | exiqsumm | sort -nr | hea`


Show frozen emails.\
`[exim -bp | grep frozen`

Remove frozen.\
`exim -bp | awk '/frozen/ {print $3}' | xargs exim -Mrm`

Check Delivery Problems.\
`grep "error" /var/log/exim_mainlog | awk '{print $NF}' | sort | uniq -c | sort -nr | head`

`grep "<=" /var/log/exim_mainlog | grep rejected | head`

Find Top Email Senders (Possible Compromised Accounts).\
`grep "A=dovecot_login" /var/log/exim_mainlog | awk -F'=' '{print $3}' | awk '{print $1}' | sort | uniq -c | sort -nr | head`

`grep "A=dovecot_login" /var/log/exim_mainlog | awk -F'=' '{print $3}' | awk '{print $1}' | sort | uniq -c | sort -nr | head`


Detect Brute-Force SMTP Attackers.\
`grep -i "auth failed" /var/log/maillog | awk '{print $NF}' | sort | uniq -c | sort -nr | head`


Detect Brute-Force SMTP Attackers.\
`grep cwd=/ /var/log/exim_mainlog | grep public_html | awk '{print $3}' | sort | uniq -c | sort -nr | head`




