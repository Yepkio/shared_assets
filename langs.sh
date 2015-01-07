mysql -u root  warmshowers -e"SELECT languages.name as lang,stats.c as c FROM ((SELECT ul.lang,count(ul.lang) as c FROM (SELECT u.language AS lang FROM users AS u WHERE u.status) AS ul GROUP BY lang)) AS stats JOIN languages ON stats.lang=languages.language ORDER BY c DESC;" | sed 's/\t/,/g' | sed 's/Chinese, Simplified/Chinese/g'> langs.csv

Rscript lang.r
