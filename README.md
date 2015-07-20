dynamic-perf Cookbook
===============
This cookbook installs Tuned and allows you tool dynamically configure default profiles and  application specific profiles on CentOS and RedHat operating systems.

Requirements
------------
Chef (12.4.1 or greater)

Red Hat Enterprise Linux (RHEL) 7

CentOS 7


Attributes
----------
default['dynamic-perf']['kernel_vaule'] - default kernel value (ex. 0)

default['dynamic-perf']['primary_tune_profile'] - primary tune profile

default['dynamic-perf']['secondary_tune_profile'] - secondary tune profile when using cron

default['dynamic-perf']['default_tune_recipe'] = - default application specifc tune profile

Usage
-----
#### dynamic-perf::default

Just include `dynamic-perf` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dynamic-perf]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 
Patrick Freeman
