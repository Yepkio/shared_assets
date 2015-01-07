mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT g.continent as continent,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u, wsuser AS w, user_location AS l, geonames_countryinfo AS g WHERE u.uid = l.oid AND u.uid = w.uid AND l.country=g.iso_alpha2 AND u.status) AS months WHERE continent='EU' GROUP BY month;"| sed 's/\t/,/g' > memeu.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT g.continent as continent,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u, wsuser AS w, user_location AS l, geonames_countryinfo AS g WHERE u.uid = l.oid AND u.uid = w.uid AND l.country=g.iso_alpha2 AND u.status) AS months WHERE continent='AF' GROUP BY month;"| sed 's/\t/,/g' > memaf.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT g.continent as continent,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u, wsuser AS w, user_location AS l, geonames_countryinfo AS g WHERE u.uid = l.oid AND u.uid = w.uid AND l.country=g.iso_alpha2 AND u.status) AS months WHERE continent='AS' GROUP BY month;"| sed 's/\t/,/g' > memas.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT g.continent as continent,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u, wsuser AS w, user_location AS l, geonames_countryinfo AS g WHERE u.uid = l.oid AND u.uid = w.uid AND l.country=g.iso_alpha2 AND u.status) AS months WHERE continent='NA' GROUP BY month;"| sed 's/\t/,/g'  > memna.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT g.continent as continent,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u, wsuser AS w, user_location AS l, geonames_countryinfo AS g WHERE u.uid = l.oid AND u.uid = w.uid AND l.country=g.iso_alpha2 AND u.status) AS months WHERE continent='SA' GROUP BY month;"| sed 's/\t/,/g' > memsa.csv

mysql -u root  warmshowers -e"SELECT month,count(month) as c FROM (SELECT g.continent as continent,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(u.created)) AS month FROM users AS u, wsuser AS w, user_location AS l, geonames_countryinfo AS g WHERE u.uid = l.oid AND u.uid = w.uid AND l.country=g.iso_alpha2 AND u.status) AS months WHERE continent='OC' GROUP BY month;"| sed 's/\t/,/g' > memoc.csv

Rscript memcont.r



