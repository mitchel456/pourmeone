heroku pgbackups:capture
curl -o latest.dump `heroku pgbackups:url`
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U pourmeone_user -d pourmeone_development latest.dump
rm latest.dump
