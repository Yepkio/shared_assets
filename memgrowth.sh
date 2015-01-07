mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(created)) AS month FROM users) AS months GROUP BY month;" | sed 's/\t/,/g'| sed '/-299,1/d'| sed 's/0,12/0,13/g' > memgrowth.csv

Rscript memgrowth.r
