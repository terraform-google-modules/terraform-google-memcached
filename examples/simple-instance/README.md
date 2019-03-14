# terraform-google-memcached

This is a module to bring up a memcached .

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ip_cidr_range | ip_cidr_range | string | `10.2.0.0/24` | yes |
| memcached_ips | List of IP addresses to use for Activemq instances. | list | - | yes |
| auto_create_subnetworks | auto_create_subnetworks | boolean | `` | no |
| subnetwork | Subnet to deploy to | string | `` | yes |
| service_account | service_account | map | `<map>` | yes |

## Verify

### On your instance type below command :
### ps -eaf | grep memcached
### and it should give below output :
/usr/bin/memcached -u memcached -p 11211 -m 2048 -c 1024 -t 4 -v >> /data1/applogs/memcached/memcached.log 2>&1