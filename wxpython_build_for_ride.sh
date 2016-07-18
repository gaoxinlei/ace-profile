# pip install robotframework
# pip install robotframework-ride
# yum -y groupinstall "Development tools"
# yum -y install mesa-libGL-devel
# yum -y install mesa-libGLU-devel
# yum -y install gstreamer-devel
# yum -y install gstreamer-python-devel
# yum -y install GConf2-devel
# yum -y install gstreamer-plugins-base-devel
# yum -y install wxPython
# yum -y install wxPython-devel

wget http://downloads.sourceforge.net/wxpython/wxPython-src-2.8.12.1.tar.bz2
tar -xjvf wxPython-src-2.8.12.1.tar.bz2
cd wxPython-src-2.8.12.1/wxPython
python setup.py install
