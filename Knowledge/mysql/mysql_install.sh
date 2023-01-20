#! /bin/bash

output=$1
echo ==================================解压安装包=============================================
tar -xvf mysql-server_8.0.32-1ubuntu20.04_amd64.deb-bundle.tar

echo ====================================dpkg安装=============================================
dpkg -i mysql-common_8.0.32-1ubuntu20.04_amd64.deb
dpkg -i mysql-community-client-plugins_8.0.32-1ubuntu20.04_amd64.deb
dpkg -i mysql-community-client-core_8.0.32-1ubuntu20.04_amd64.deb
dpkg -i mysql-community-client_8.0.32-1ubuntu20.04_amd64.deb
dpkg -i mysql-client_8.0.32-1ubuntu20.04_amd64.deb
apt install libmecab2 -y
apt install libaio1 -y
dpkg -i libmysqlclient21_8.0.32-1ubuntu20.04_amd64.deb
dpkg -i libmysqlclient-dev_8.0.32-1ubuntu20.04_amd64.deb
dpkg -i mysql-community-server-core_8.0.32-1ubuntu20.04_amd64.deb
dpkg -i mysql-community-server_8.0.32-1ubuntu20.04_amd64.deb

# dpkg -i mysql-community-server-debug_8.0.32-1ubuntu20.04_amd64.deb
# dpkg -i mysql-community-test_8.0.32-1ubuntu20.04_amd64.deb
# dpkg -i mysql-community-test-debug_8.0.32-1ubuntu20.04_amd64.deb
# dpkg -i mysql-server_8.0.32-1ubuntu20.04_amd64.deb
# dpkg -i mysql-server_8.0.32-1ubuntu20.04_amd64.deb-bundle.tar
# dpkg -i mysql-testsuite_8.0.32-1ubuntu20.04_amd64.deb

echo ===================================mysql配置远程================================
mysql -uroot -p123 < ./romote.sql
systemctl restart mysql



