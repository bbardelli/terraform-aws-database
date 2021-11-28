application terraform module
===========

A terraform module to provide a <application infrastructure> in AWS

This version provides a single instance internet facing connection at port 8080 for applications

Module Input Variables
----------------------

- `role` - string - role id to update with policy
- `region` - string - name of the region to be applied




Usage
-----

```hcl
module "database" {
  source  = "app.terraform.io/company-foobar/database/aws"
  version = "x.y.z"
  role = var.role_id
  region = "us-east-1"
}
```


Outputs
=======

 - `endpoint` - published endpoint
 - `security_group_id` - compte security group
 - `compute_role` - isntance role used


Authors
=======

Bruno Bardelli