mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT u.language as lang,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u WHERE u.status) AS months WHERE lang ='en-working' GROUP BY month;"| sed 's/\t/,/g' > memlen.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT u.language as lang,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u WHERE u.status) AS months WHERE lang ='fr' GROUP BY month;"| sed 's/\t/,/g' > memlfr.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT u.language as lang,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u WHERE u.status) AS months WHERE lang ='es' GROUP BY month;"| sed 's/\t/,/g' > memles.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT u.language as lang,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u WHERE u.status) AS months WHERE lang ='de' GROUP BY month;"| sed 's/\t/,/g' > memlde.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT u.language as lang,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u WHERE u.status) AS months WHERE lang ='pt-br' GROUP BY month;"| sed 's/\t/,/g' > memlpt.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT u.language as lang,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u WHERE u.status) AS months WHERE lang <>'en-working' AND lang <>'pt-br' AND lang <>'de' AND lang <>'es' AND lang <>'fr' GROUP BY month;"| sed 's/\t/,/g' > memloth.csv

Rscript memlang.r



