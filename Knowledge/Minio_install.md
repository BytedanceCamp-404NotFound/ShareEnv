# git 教程
```cpp
// @author: 颜子翔 
// @birthday: 2023-1-20
// @version: V1.0
```


# 安装docker
1)按指令安装
```shell
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
```
2)查看是否安装成功
docker version


# 安装minio
```shell
docker run -it -d -p 9000:9000 -p 9001:9001 --name minio \
-e "MINIO_ACCESS_KEY=minio" \
-e "MINIO_SECRET_KEY=minio123" \
-v /home/admin/minio/data:/data \
-v /home/admin/minio/config:/root/.minio \
minio/minio server /data \
--console-address ":9000" --address ":9001"
```
MINIO_ACCESS_KEY账号
MINIO_SECRET_KEY密码


http://39.106.72.165:9000
本地：
http://127.0.0.1:9000






# 参考资料

http://t.csdn.cn/mSo05

