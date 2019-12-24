# terraform-google-memcached

This is a module to bring up a memcached instance.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| project\_id | The project ID to create resources within | string | n/a | yes |
| region | Region to create resources in | string | `"us-central1"` | no |
| service\_account | The service account e-mail address. If not given, the default Google Compute Engine service account is used | string | n/a | yes |

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
