# VSCode 教程
```cpp
// @author: 颜子翔 
// @birthday: 2023-1-18
// @version: V1.0
```


# 代码里的左侧颜色标识:

红色，未加入版本控制; (刚clone到本地)
绿色，已经加入版本控制暂未提交; (新增部分)
蓝色，加入版本控制，已提交，有改动； (修改部分)
白色，加入版本控制，已提交，无改动；
灰色：版本控制已忽略文件。

git文件标识:
M: 文件的内容被修改了
U: 文件没有被合并(你需要完成合并才能进行提交)
D: 删除的一个文件

A: 增加的文件.
C: 文件的一个新拷贝.
R: 文件名被修改了。
T: 文件的类型被修改了。
X: 未知状态

# 使用VSCode远程调试linux

1. 准备工作
```
apt-get update
apt-get install sudo
apt-get install vim
passwd # 修改密码
```
2. 安装openssh
apt-get install openssh-server
apt-get install openssh-client
3. 修改ssh配置文件 
sudo vi /etc/ssh/sshd_config
PermitRootLogin yes 
（默认为#PermitRootLogin prohibit-password）前面的#号要放开
4. 启动服务
/etc/init.d/ssh restart
5. 连接测试
ssh user@[ip] -p [端口]
ssh user@192.168.0.3 -p 22
6. vscode配置
```
Host 192.168.0.3
  HostName 192.168.0.3
  User username
```


# 使用VSCode远程调试linux中的容器

1. 需要把容器的端口映射出来

容器内的ssh修改需要把root登录打开
sudo vi /etc/ssh/sshd_config
PermitRootLogin yes 
重启，连接测试，可以连接

```
Host 15.1.0.89      # 显示的名字
  HostName 15.1.0.89
  User root
  Port 38529        # 使用的端口号
  IdentityFile ~\.ssh\id_rsa
```

# 快捷键

| 快捷键 | 功能 | 
| :----: | :----: | 
| ctl + k + 0 | 快速收缩全部代码 | 
| ctl + k + j | 展开全部代码 | 
| ctl + shift + [ | 收缩当前代码 | 
| ctl + shift + ] | 展开当前代码 | 
| alt + left | 向后 | 
| alt + left | 向前 | 
| ctl + g | 跳到指定行 | 
| ctl + b | 关闭左侧栏 | 
| ctl + j | 关闭下面栏 | 
| ctl + K + T | 换主题颜色 | 

# 一些设置
C++不报错
C_Cpp.errorSquiggles


code runner在命令行中运行，可以接受输入
Code-runner: Run In Terminal
# 前端使用的插件

快捷键
开头按输入!,自动填充基础内容


# Live Server
保存以后会自动更新
alt+KO可以打开新页面
# 代码滚动时候进行附着
sticky scroll
打开以后会把函数名进行附着

# 参考文献


[在VScode中，代码提示左边的图标各自代表的含义]https://blog.csdn.net/qq_42838904/article/details/108222619
[Sticky Scroll in vscode]https://dev.to/this-is-learning/sticky-scroll-in-vscode-44h2