# git 教程
```cpp
// @author: 颜子翔 
// @birthday: 2023-1-18
// @version: V1.0
```

# linux环境下下载
1. ```git clone [ssh地址]```
直接克隆代码

2. ```git clone -b [分支名字] [ssh地址]```
需要克隆这个代码的一个分支


# linux环境下提交
1. ```git init```
git初始化
输出：
```
Initialized empty Git repository in /home/yzx/network/.git/
```
2. ```git add .```
提交所有的内容
输出：
无
3. ```git status```
查看当前提交的状态
```
On branch master
No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   ch04/4-2-1-getpid.c
        new file:   ch04/4-2-2-fork.c
        new file:   ch04/4-2-3-system.c
        new file:   ch04/4-2-4-ececve.c
        new file:   ch04/4-4-1-pthread.c
        new file:   ch04/a.out
```

4. ```git commit -m "ch04"```
提交到远程仓库
git commit 规范指南
Commit message 的格式
```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```
### type
用于说明 commit 的类别，只允许使用下面7个标识。
feat：新功能（feature）
fix/to：修补bug
  - fix：产生 diff 并自动修复此问题。适合于一次提交直接修复问题
  - to：只产生 diff不 自动修复此问题。适合于多次提交。最终修复问题提交时使用 fix
docs：仅仅修改了文档（documentation）
style： 仅仅修改了空格、格式缩进、逗号等等，不改变代码逻辑
refactor：代码重构，没有加新功能或者修复 bug（即不是新增功能，也不是修改bug的代码变动）
test：增加测试
chore：改变构建流程、或者增加依赖库、工具等
revert：回滚到上一个版本
merge：代码合并
sync：同步主线或分支的Bug


### scope
scope用于说明 commit 影响的范围，比如数据层、控制层、视图层等等，视项目不同而不同。
### subject
subject是 commit 目的的简短描述，不超过50个字符。
### Body
Body 部分是对本次 commit 的详细描述，可以分成多行。下面是一个范例。


5. ```git remote add origin git@github.com:gtoo8888/linux-network.git```
正常输出：
无</br>

- 报错：
- fatal: remote origin already exists.
- - 解决：
- 1. git remote -v 查看远程的仓库有什么
- - 输出：
- - origin  git@github.com:gtoo8888/linux-network.git (fetch)
- - origin  git@github.com:gtoo8888/linux-network.git (push)
- 2. git remote rm origin 移除远程的仓库
- - 输出：无
- 3. git remote add origin git@github.com:gtoo8888/linux-network.git 再次使用指令

6. ```git push origin master```
步骤5操作过一次以后，下一次就不需要了

输出：
```
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 2 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (9/9), 3.65 KiB | 1.21 MiB/s, done.
Total 9 (delta 0), reused 0 (delta 0)
remote:
remote: Create a pull request for 'master' on GitHub by visiting:
remote:      https://github.com/gtoo8888/linux-network/pull/new/master
remote:
To github.com:gtoo8888/linux-network.git
 * [new branch]      master -> master
```
报错：
error: src refspec main does not match any
error: failed to push some refs to 'git@github.com:gtoo8888/linux-network.git'
报错原因：
本地文件与github上的文件有冲突
本地需要提交的文件中存在空文件
本地的origin和remote origin/master 没有建立关联
解决方法：
git push origin main
发现仓库中主要分支叫做master修改后就好了

# 生成ssh秘钥
git config --global user.name "XXX"
git config --global user.email "XXX"
## 1.生成公钥：
git命令：ssh-keygen  -m [密钥格式]  -t [密钥类型]  -C[密钥注解] 
```
ssh-keygen -m PEM -t ed25519 -C "ujm456@126.com"
ssh-keygen -m PEM -t ed25519 -C "your.email@example.com" // 创建新的 SSH 私钥与公钥秘钥对，输入你的邮箱作为标签
Enter file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter] // 推荐使用默认地址
Enter passphrase (empty for no passphrase): // 此处直接回车即可；若设置密码，则每次使用 SSH 方式推送代码时都会要求输入密码
```
成功之后显示：
```
Your identification has been saved in /Users/you/.ssh/id_rsa.
# Your public key has been saved in /Users/you/.ssh/id_rsa.pub.
# The key fingerprint is:
# 01:0f:f4:3b:ca:85:d6:17:a1:7d:f0:68:9d:f0:a2:db your.email@example.com
```
## 2.添加公钥
windows地址为（C:\Users\you\.ssh）
linux地址为（/home/user/.ssh/id_ed25519）
linux地址为（/root/.ssh/id_ed25519）
打开上文中生成的秘钥对的地址（默认地址通常为 ~/.ssh/）找到后缀为 pub 的公钥文件，使用 cat 命令输出所有内容并复制。

## 3.尝试使用ssh连接github
ssh -T git@github.com
ssh -T git@e.coding.net

# 一些git的命令

## git LFS技术
可以用来存放大文件

git lfs pull --all
git lfs pull


## checkout
git checkout -- bin/test_tool.sh

放弃工作区中全部的修改
git checkout .

放弃工作区中某个文件的修改：
git checkout -- filename


## git submodule
当我们的项目很大很复杂的时候，需要将各个模块文件进行抽离，以此来降低项目文件之间的耦合程度。（当然你项目不大不复杂也可以使用，看个人喜好啦！！！）这个时候就可以使用git submodule来对项目文件进行抽离，最终使抽离出来的文件可以单独成为一个git仓库。这样做的好处是整个主项目对抽离出来的子项目（子模块）有依赖关系，却又并不关心子项目（子模块）的内部开发流程细节。

```
git submodule init
# 初始化子项目
git submodule update
# 对子项目获取远程项目中最新的状态
```
# git rm 
git rm --cached <File Name>
git rm --cached test
<File Name>直接写要删除的文件或者文件夹名字就可以
删除之后把自己需要的文件加上
git add .
git commit -m ""
git push 


git rm -r --cached .
.gitignore不生效


# git config
git config --list
列出git的所有配置

git配置中的CRLF、LF、CR
CRLF: Carriage-Return Line-Feed的缩写，意思是回车换行，即\r\n;
LF: Line-Feed的缩写,意思是换行，即\n;
CR: Carriage-Return的缩写，回车，即\r;
进阶
当我们敲击回车键(Enter)时，操作系统会插入不可见的字符表示换行，不同的操作系统插入不同
Windows: 插入\r\n,回车换行；
Linux\Unix: 插入\n,换行；
MacOS: 插入\r，回车；


git config --global core.autocrlf input

AutoCRLF
提交时转换为LF，检出时转换为CRLF
git config --global core.autocrlf true
提交时转换为LF，检出时不转换
git config --global core.autocrlf input
提交检出均不转换
如果下windows下下载的文件，需要映射到linux中去，不用总是手动改变编码


# git branch
查看当前所在分支 

```git branch -r```
查看远程有哪些分支

```git branch -v```
显示当前分支的详细信息

```git branch -d feat-0728```
删除本地创建的分支

# git reset
```git reset HEAD ```
恢复已经add的提交
```git reset HEAD test.cpp```
指定文件恢复


```git reset HEAD^ ```           
回退所有内容到上一个版本  
```git reset HEAD^ hello.php  ```    
回退 hello.php 文件的版本到上一个版本  



# git 高级技术

## git log

```
git log --pretty=format:'%h: %s'
d27f636: test:15
e54dd6f: test:rebase 12
db794d8: test:11
ee8c5a3: test:rebase
5a30601: test:3
08089a1: test:2
4a82470: test:1
46480b8: feat:增加了链接
7035791: feat:init
2544c56: Initial commit
```

只显示一行，详细的
git log --pretty=oneline
只显示一行
git log --oneline
显示图形界面
git log --graph
## git rebase

步骤一：
git rebase -i [startPonit] [endPoint]
一般不使用endPoint
git rebase -i ee8c5a3
(ee8c5a3,d27f636]
(test:rebase,test:15]
步骤二：
接下来进入图形界面
p 选择
s 放弃
步骤二：
图形界面2
注释掉不想要提交的
:wq退出


如果需要rebase已经push的commit
需要在提交的时候直接git push -f强制交上去，就会刷新掉之前的提交

# 修改最后一次提交的注释

git commit --amend 

# git stsh 暂存
暂存命令
git stash save "暂存的备注"
直接执行git stash也可以达到暂存的目的，但是连续多次暂存后容易让人混淆哪次暂存了哪些代码

查看暂存记录
git stash list
取回暂存代码
git stash pop
取消【取消暂存代码】

git reset --hard

# git gc

在当前存储库中运行许多内务处理任务，例如压缩文件修订（以减少磁盘空间并提高性能）
并移除可能由之前git add调用创建的不可达对象。

鼓励用户在每个存储库中定期运行此任务，以保持良好的磁盘空间利用率和良好的操作性能。

git-gc  - 清理不必要的文件并优化本地存储库

Git是如何存储对象的

Git 中存在两种对象 -  松散对象(loose object) 和 打包对象(packed object) .

git gc 为了定时的对文件进行打包
松散对象存储的文件，一个很大的文件1G的文件，改动一行，那依然会有一个1G的副本保存下来
所以需要将松散对象打包为打包对象用来节约存储空间

关闭自动打包的原理是：
如果有大文件包含在文件夹中，并且需要经常改动，那么就需要打开gc机制
但是正常情况下，提交的都是几KB的小文件，源代码之类的，空间占用的很好，关闭git gc机制，还可以更好的溯源文件变化情况

问题：
git gc以后，会消失一些什么信息？

# git reflog

如果使用git reset --herd HEAD^回退了版本，会出现amend的未来提交
可以使用reflog查看到，并且回退到未来的版本

# 参考文献
[GIT在线练习平台]https://learngitbranching.js.org/?locale=zh_CN
https://blog.csdn.net/ajianyingxiaoqinghan/article/details/70544159
https://blog.csdn.net/u014361280/article/details/109703556
[git submodule]https://blog.csdn.net/weixin_44901565/article/details/123086226
[git配置中的CRLF、LF、CR]https://blog.csdn.net/u013037336/article/details/121541008
[git commit -m约定式提交]https://www.conventionalcommits.org/zh-hans/v1.0.0/
[白色箭头]https://blog.csdn.net/bowenlaw/article/details/124594664
[git commit 规范指南]https://blog.csdn.net/qq_41662115/article/details/99759645
[.gitignore基础规则]https://www.cnblogs.com/kevingrace/p/5690241.html
[git rebase]https://blog.csdn.net/small_white_123/article/details/121563248
[git reset HEAD 用法]https://blog.csdn.net/wangkai6666/article/details/120810363
[英文git教程网站]https://www.atlassian.com/git
[git commit --amend]https://blog.csdn.net/xiaoyulike/article/details/119176756
[git - 执行 git clone 时 "Filtering content"是什么意思？]https://www.coder.work/article/1531074
[为什么要管理git gc自动垃圾回收(英文)]https://donatstudios.com/yagni-git-gc
[为什么要git gc]https://www.cnblogs.com/ayseeing/p/4226471.html
[Git是如何存储对象的]https://blog.csdn.net/hudashi/article/details/7669477
[10.4 Git 内部原理 - 包文件]https://git-scm.com/book/zh/v2/Git-%E5%86%85%E9%83%A8%E5%8E%9F%E7%90%86-%E5%8C%85%E6%96%87%E4%BB%B6
[Git是如何存储对象的- 7. 原理解析- [ Git Community Book 中文版 ...]https://www.shouce.ren/api/view/a/9924
[git 版本回退]https://www.liaoxuefeng.com/wiki/896043488029600/897013573512192
[【学了就忘】Git操作 — 51.git reflog命令]https://www.jianshu.com/p/7e4cef3863e7
[Good First Issue]https://goodfirstissue.dev/language/cplusplus/