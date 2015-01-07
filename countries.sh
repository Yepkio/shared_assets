mysql -u root  warmshowers -e"SELECT fullname,u.mail,g.name FROM users as u,wsuser as w, user_location as l, geonames_countryinfo as g WHERE u.uid = w.uid AND w.uid=l.oid AND l.country=g.iso_alpha2;"| sed 's/,/ /g' | sed 's/\t/,/g' |sed '/Hōkan/c\Hōkan,United States'  > countries.csv

Rscript countries.r

