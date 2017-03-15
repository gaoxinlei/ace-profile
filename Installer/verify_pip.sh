source $(dirname $0)/precondition.sh

if which pip > /dev/null 2>&1; then
   return 0
fi

CENTOS()
{
   $YUM python-pip
}

UBUNTU()
{
   $APTGET python-pip
}

$PIP --upgrade pip 
