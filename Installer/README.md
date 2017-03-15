If you want to add a new installer script, please follow the rule as below:

```
#!/usr/bin/bash
source $(dirname $0)/precondition.sh

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
