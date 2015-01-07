mysql -u root  warmshowers -e"SELECT node.uid AS FromM,tr.field_member_i_trust_uid as ToM,tr.field_hosting_date_value as date,field_guest_or_host_value as gh,TIMESTAMPDIFF(MONTH,'1995-01-01 00:00:00',FROM_UNIXTIME(node.created)) AS age, field_rating_value as rate FROM content_type_trust_referral AS tr,node WHERE node.nid=tr.nid AND tr.vid=node.vid AND node.uid<>tr.field_member_i_trust_uid" | sed 's/\t/µ/g' | sed 's/,/*/g' | sed 's/µ/,/g' >  cs.csv

Rscript wscommunity.r
