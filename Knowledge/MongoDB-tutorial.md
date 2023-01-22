MongoDB和MySQL的对应关系

| SQL术语/概念 | MongoDB术语/概念 | 解释/说明                            |
| ------------ | ---------------- | ------------------------------------ |
| database     | database         | 数据库                               |
| table        | collection       | 数据库表/集合                        |
| row          | document         | 数据记录行/文档                      |
| column       | field            | 数据字段/域                          |
| index        | index            | 索引                                 |
| table joins  |                  | 表连接，MongoDB不支持                |
|              | 嵌入文档         | MongoDB通过嵌入式文档来替代多表连接  |
| primary key  | primary key      | 主键，MongoDB自动将_id字段设置为主键 |





##### 安装
可以使用下面命令一步一步执行，也可以使用mongodb文件夹里面的脚本文件。执行前先修改配置文件里面的bindIp后面的ip地址，localhost不用动，修改后面的ip地址为你自己的虚拟机ip或者服务器内网ip，一定要**把mongodb文件夹里的配置文件和mongdb压缩包放在一个目录下，并且就在该目录下执行脚本文件**

下载安装包

https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-4.0.28.tgz

可以在本机下好然后传输到虚拟机下

在压缩包的目录下，先切换到root用户，执行以下命令

```bash
sudo su
cd /home
mkdir mongodb
mv mongodb-linux-x86_64-4.0.28.tgz /home/mongodb
cd /home/mongodb
tar -xvf mongodb-linux-x86_64-4.0.28.tgz
mkdir -p /single/data/db
mkdir -p /single/log
```

在/home/mongodb/single下创建配置文件mongod.conf

```bash
vim /home/mongodb/single/mongod.conf
```

```yaml
systemLog:
   #MongoDB发送所有日志输出的目标指定为文件
   #The path of the log file to which mongod or mongos should send all diagnostic logging information
   destination: file
   #mongod或mongos应向其发送所有诊断日志记录信息的日志文件的路径
   path: "/home/mongodb/single/log/mongod.log"
   #当mongod或mongos实例重新启动时，mongod或mongos会将新条目附加到现有日志文件的末尾
   logAppend:  true
storage:
   #mongod实例存储其数据的目录。storage.dbPath设置仅适用于mongod
   #The directory where the mongod instance stores its data.Default value is "/data/db"
   dbPath: "/home/mongodb/single/data/db"
   journal:
      #启用或禁用持久性日志以确保数据文件保持有效和可恢复
      enabled: true
processManagement:
   #启用在后台运行mongos或mongod进程的守护进程模式
   fork: true
net:
   #服务实例绑定的IP，默认是localhost
   bindIp: localhost,192.168.31.132
   #bindIp
   #绑定的端口，默认是27017
   port: 27017
security:
   #添加认证，防止数据库内容被黑客劫持绑架导致丢失
   authorization: enabled
```

添加权限

```bash
chmod 777 -R /home/mongodb
```

启动服务

```bash
/home/mongodb/mongodb-linux-x86_64-4.0.28/bin/mongod -f /home/mongodb/single/mongod.conf
```

连接mongodb的命令

```bash
/home/mongodb/mongodb-linux-x86_64-4.0.28/bin/mongo
```







##### 常用操作

###### 选择数据库

```sql
use 数据库名称
```

使用use指令选择数据库时，若选择的数据库不存在则会自动创建一个新的数据库



###### 查看所有数据库

```sql
show dbs
#或者
show databases
```

###### 查看当前处于哪个数据库

```sql
db
```

###### 查看数据库中的集合(也就是MySQL中的表)

```sql
show collections
#或者
show tables
```

###### 在集合中插入文档

相当于在MySQL数据库的表中插入数据

```sql
db.表名.insert(
    {
    	"name":"john",
    	"age":18,
    }
)
```

当所填的表名不存在，则会自动创建表



###### 文档查询

```sql
db.表名.find(query, projection)
```

query表示查询的条件，projection表示要显示的字段，若全部字段都显示则可以省略projection。例如查询comment表中name为john的文档，显示所有字段

```sql
db.comment.find({name:"john"})
```

查询comment表中name为john的文档，只显示name字段和age字段

```sql
db.comment.find({name:"john"},{name:1, age:1})
```

设置成1表示显示查询结果时显示该字段



###### 文档更新

```sql
db.collection.update(query, update)
```

query表示修改的条件，update表示修改的值

例如：修改comment表下，userid为1003的用户，把它的nickname修改为凯撒

```sql
db.comment.update({userid:"1003"},{nickname:"凯撒2"})
```

执行后会发现这条文档除了userid和nickname字段，其他字段都不见了

为了解决这个问题，需要使用修改器$set来实现，命令如下

```sql
db.comment.update({userid:"1003"},{$set:{nickname:"凯撒"}})
```



###### 文档删除

```sql
db.表名.remove(条件)
```

以下语句可以将数据全部删除，请慎用

```
db.comment.remove({})
```

如果删除_id=1的记录，输入以下语句

```
db.comment.remove({_id:"1"})
```



