If you want to add a new installer script, please follow the rule as below:

```
#!/usr/bin/bash
current_dir=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
# don't use $0, because it won't work if "source /path/xxx.sh".
# current_dir=$(cd `dirname $0`}; pwd)
source $current_dir/precondition.sh

# the function name is consistent with $RELEASE defined in precondition.sh
CENTOS()
{
  # add the procecc in centos
}

UBUNTU()
{
  # add the procecc in ubuntu

}

# other linux system function if you want to add

# Execution if it matched the current operation system.
$RELEASE
```
Note, please ensure you have the sudo privilege to execute the script which using yum/apt-get etc.
