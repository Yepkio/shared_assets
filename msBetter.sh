mysql -u root warmshowers -e"SELECT ms1.Source,ms1.Target,ms1.timefromcreated as first,ms2.timefromcreated as second FROM (SELECT author as Source,recipient as Target,TIMESTAMPDIFF(HOUR,'2015-01-01 00:00:00',FROM_UNIXTIME(MIN(timestamp))) AS timefromcreated FROM pm_message JOIN pm_index ON pm_message.mid=pm_index.mid AND author<>recipient GROUP BY author,recipient) as ms1 JOIN (SELECT author as Source,recipient as Target,TIMESTAMPDIFF(HOUR,'2015-01-01 00:00:00',FROM_UNIXTIME(MIN(timestamp))) AS timefromcreated FROM pm_message JOIN pm_index ON pm_message.mid=pm_index.mid AND author<>recipient GROUP BY author,recipient) AS ms2 ON ms1.Source=ms2.Target AND ms1.Target=ms2.Source;"| sed 's/\t/,/g' > msfb.csv





