# terraform-google-memcached

This is a module to bring up a memcached cluster.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow\_stopping\_for\_update | Allow stopping the instance for specific Terraform changes (e.g. service account update). | bool | `"true"` | no |
| app\_tags | Application tags | list(string) | `<list>` | no |
| boot\_disk\_image | Boot disk image | string | `"debian-cloud/debian-9"` | no |
| boot\_disk\_size | Boot disk size in GB | string | `"100"` | no |
| boot\_disk\_type | Boot disk type | string | `"pd-ssd"` | no |
| env | Environment | string | `""` | no |
| machine\_type | Memcached instance machine type | string | `"n1-standard-2"` | no |
| memcached\_ips | A list of static IP addresses for memcached. | list(string) | n/a | yes |
| project\_id | The project to deploy to, if not set the default provider project is used. | string | `""` | no |
| region | Region to launch instances | string | `"us-central1"` | no |
| service\_account | The service account e-mail address. If not given, the default Google Compute Engine service account is used | string | n/a | yes |
| subnetwork | The name or self_link of the subnetwork to attach the network interface to | string | n/a | yes |
| zone | The zone that the machine should be created in | string | `"us-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_names | List of self_links for compute instances |
| instances | List of self_links for compute instances |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Verification

To verify that `memcached` came up properly, run the following command on the created instance:

```bash
$ ps -eaf | grep memcached
```

You should see the following output:

```
/usr/bin/memcached -u memcached -p 11211 -m 2048 -c 1024 -t 4 -v >> /data1/applogs/memcached/memcached.log 2>&1
```
