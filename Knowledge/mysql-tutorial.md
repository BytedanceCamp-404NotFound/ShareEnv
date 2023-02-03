# mysql 教程
```cpp
// @author: 颜子翔 
// @birthday: 2023-1-20
// @version: V1.0
```


# 修改远程登录权限
use mysql
select User,authentication_string,Host from user;
update user set host='%' where user='root';
FLUSH PRIVILEGES;

# 更新mysql密码
```sql
use mysql;
select User,authentication_string,Host from user;
update user set authentication_string='' where user='yzx';--先将字段置空
ALTER user 'yzx'@'%' IDENTIFIED BY 'yzx';--修改密码为yzx
FLUSH PRIVILEGES;
systemctl restart mysql
```

use mysql;
select User,authentication_string,Host from user;
update user set authentication_string='' where user='root';--先将字段置空
ALTER user 'root'@'%' IDENTIFIED BY 'cab955b6a72135c64be7c6a5a29232ac';--修改密码为yzx
FLUSH PRIVILEGES;
systemctl restart mysql

systemctl status mysql

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';


lsof -i:80

CREATE DATABASE SimpleTikTok;

# 开启慢日志

`方法一`

进入mysql里面，输入

```mysql
set global slow_query_log='ON';
```

然后输入

```mysql
show variables like '%query%';
```

可以查看查询相关设置，包括慢查询是否开启、慢查询时间以及慢查询日志文件地址

**缺点**：每次重启mysql后设置会被清除，即每重启一次mysql就要设置手动开启一次慢日志



`方法二`

使用配置文件

找到配置文件位置，**配置文件是mysqld.cnf**，不是mysql.cnf，目前所用的腾讯云服务器的配置文件地址是 */etc/mysql/mysql.conf.d/mysqld.cnf*。在配置文件中，在nysqld标签下添加 slow_query_log  = ON 即可。然后保存退出，执行

```bash
systemctl restart mysql;
```

慢查询日志文件地址在 */var/lib/mysql/VM-12-13-ubuntu-slow.log*，默认超过10s的查询就是慢查询，会记录在日志中

这种方法重启mysql后，慢查询依然开启，不需要再次设置





# 参考资料


https://www.cnblogs.com/rickiyang/p/14517120.html