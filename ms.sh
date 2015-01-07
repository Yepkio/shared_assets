mysql -u root  warmshowers -e"SELECT author as Source,recipient as Target,TIMESTAMPDIFF(HOUR,'2015-01-01 00:00:00',FROM_UNIXTIME(MIN(timestamp))) AS timefromcreated FROM pm_message JOIN pm_index ON pm_message.mid=pm_index.mid AND author<>recipient GROUP BY author,recipient"| sed 's/\t/,/g' > msfirst.csv

mysql -u root  warmshowers -e"SELECT author as Source,recipient as Target,TIMESTAMPDIFF(HOUR,'2015-01-01 00:00:00',FROM_UNIXTIME(timestamp)) AS timefromcreated  FROM pm_message JOIN pm_index ON pm_message.mid=pm_index.mid AND author<>recipient"| sed 's/\t/,/g' > ms.csv

Rscript ms.r



