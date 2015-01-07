mysql -u root warmshowers -e"SELECT ls,count(ls) AS c FROM (SELECT thread_id,COUNT(mid) as ls FROM pm_index GROUP BY thread_id) as threadls GROUP BY ls;"| sed 's/\t/,/g' > threadls.csv

Rscript threadls.r



