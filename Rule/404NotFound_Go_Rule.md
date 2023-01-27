# 404NotFound的go编码规范


# 1 文件/文件夹 命名
## 1.1 [必须]文件名全部使用小写，不用_拼接
尽可能丰富文件的名字，提供更多的信息
推荐写法:
```go
mysqlconnect.go
model.go // 特殊文件名不需要修改
```
不建议写法：
```go
init.go // 只有一个词语，尽量丰富内容，减少重名
connect.go
mysql_connect.go  // 下划线连接
MyMYSQLConnect.go   //  有大小写
```
## 1.2 [必须]文件夹名字，全部小写
推荐写法:
```mysqlconnect```
不建议写法：
```go
mysql_connnect
MySQLConnect
mySQLConnect
```
# 2 函数规范
## 2.1 [必须]除了少部分的工具函数，所有函数必须返回错误
下面的极小的工具函数可以不返回错误
```go
func GetTime() int64 {
	return time.Now().Unix()
}
```
## 2.2 [建议]函数名尽量少使用一个单词
推荐写法：
 ```go
func GetVideoList(AuthorID int) ([]VideoInfo, error)  // 动词+名词
func CreateInfo(UserName string, uid int64) error  
func init() // 特殊的函数名不需要修改
```
不建议写法：
```go
func Connect(database string, Table string, url string) (*minio.Client, error) // 可能会创立很多的连接，函数容易重名
```
## 2.3 [建议]返回值一般情况不写变量名，只写变量类型
防止返回值过于冗长，看情况自己考虑
如果写了第一个返回值名称，后面也需要填写
```go
// 推荐写法：
func GetVideoList(AuthorID int) ([]VideoInfo, error)  // 动词+名词
func CreateInfo(UserName string, uid int64) error  
func init() // 特殊的函数名不需要修改
// 不建议写法：
func Connect(database string, Table string, url string) (minio minio*minio.Client,err error) // 可能会创立很多的连接，函数容易重名
```
# 3 统一注释风格
## 3.1 [必须]使用中文
## 3.2 [建议]函数注释

推荐写法：
```go
// 中文注释[大概写一个下功能]
func CreateInfo(UserName string, uid int64) error  
```
暂时不用：
```go
/*
 * 函数功能：token认证
 * 输入参数 TokenString:token的字符串形式
 * 返回值 flag:鉴权是否成功
 *        id:提取出的user_id
 */
```
## 3.2 [建议]变量注释
一般跟在函数名后面，过长的写在上方
```go
var err error  // 这是一个错误
```


# 4. 日志打印
## 4.1 [必须]使用logx进行日志输出
## 4.2 [建议]对外接口的错误返回
```go
db, err := sql.SqlConnect()
if err != nil {
   // 错误日志 [包名字] [函数名称] [当前调用的函数/当前做的操作] [可选:error内容]
   logx.Errorf("[pkg]logic [func]Feed [msg]select feedUserInfo [err]%v", err)
   return &types.FeedHandlerResponse{
      // 使用公用库返回错误码
      StatusCode: commonerror.CommonErr_INTERNAL_ERROR,  
      // 使用接口的错误消息，使用中文名
      StatusMsg:  "取流失败", 
   }, nil
}
```
## 4.3 [建议]普通函数中的错误处理
1. 有错误信息
```go
func example() (string, error) {
   // 错误日志 [pkg][包名字] [func][函数名称] [msg][当前调用的函数/当前做的操作] [err][可选:error内容]
   err = db.Model(&sql.UserInfo{}).Where("user_id = ?", userId).First(&feedUserInfo).Error
   if err != nil {
      logx.Errorf("[pkg]logic [func]Feed [msg]select feedUserInfo [err]%v", err)
      return nil, err
   }
}
```
2. 没有错误信息
```go
func example() (string, error) {
	// 错误日志 [pkg][包名字] [func][函数名称] [msg][当前调用的函数/当前做的操作]
	configFile = getExeFile()
	if configFile == "" {
		logx.Errorf("[pkg]viperconfigread [func]getExeFile [msg]configFile is nil")
		return "", nil
	}
}
```
## 4.4 [建议]一个函数如果提前返回，需要打印Infof来来保障信息提示
 ```go
func GetVideoList(AuthorID int) ([]VideoInfo, error) {
	n, err := VideoNum(AuthorID)
	if n == 0 {  // 对于一些提前返回的不是错误的信息，打印日志来方便调试
		logx.Infof("[pkg]mysqlconnect [func]GetVideoList [msg]VideoNum is 0")
		return list, nil
	}
	err := db.Table("video_info").Where("author_id = ?", AuthorID).Find(&list).Error
	if err != nil { 
		logx.Errorf("[pkg]mysqlconnect [func]GetVideoList [msg]mysql error [err]err:%v", err)
		return nil, err // 只要有提前返回值，那么就需要打印Errorf或者Infof
	}
	return list, nil  // 函数结尾的返回默认是正确执行，不打印日志
}
```




