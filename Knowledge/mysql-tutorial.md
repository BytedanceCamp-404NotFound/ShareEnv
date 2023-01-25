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

# 参考资料


https://www.cnblogs.com/rickiyang/p/14517120.html