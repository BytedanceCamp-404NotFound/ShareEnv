sudo su
mkdir -p /home/mongodb
mv mongodb-linux-x86_64-4.0.28.tgz /home/mongodb

mkdir -p /home/mongodb/single/data/db
mkdir -p /home/mongodb/single/log
mv mongod.conf /home/mongodb/single
cd /home/mongodb
tar -xvf mongodb-linux-x86_64-4.0.28.tgz
chmod 777 -R /home/mongodb
/home/mongodb/mongodb-linux-x86_64-4.0.28/bin/mongod -f /home/mongodb/single/mongod.conf
rm -rf mongodb-linux-x86_64-4.0.28.tgz
