# terraform-google-memcached

This is a module to bring up a memcached .

## Inputs


## Verify

### On your instance type below command :
### ps -eaf | grep memcached
### and it should give below output :
/usr/bin/memcached -u memcached -p 11211 -m 2048 -c 1024 -t 4 -v >> /data1/applogs/memcached/memcached.log 2>&1