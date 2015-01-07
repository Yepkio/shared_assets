mysql -u root  warmshowers -e"SELECT g.continent, COUNT(*) members, ROUND((COUNT(*) * 100)/@total, 1) AS percent FROM users AS u, wsuser AS w, user_location AS l, geonames_countryinfo AS g WHERE u.uid = l.oid AND u.uid = w.uid AND l.country=g.iso_alpha2 AND u.status GROUP BY g.continent;" | sed 's/NA/NO/g'| sed 's/\t/,/g' > continents.csv

Rscript continents.r
