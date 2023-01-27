# 404NotFound的go编码规范

大驼峰？

1. 文件名命名
   1. 文件名全部使用小写，不用_拼接
   2. 文件夹名字，全部小写
2. 函数命名
    1. 不允许一个单词
       1. func Connect(database string, 
    2. 返回值一般情况不写变量名，只写变量类型
3. 统一注释风格
    1. 函数名字前// XXXX
    2. 使用中文
4. 日志打印
   1. logx
   2. 具体打印的信息
5. 规范错误处理
   1. 排查时候的唯一工具

```go
// 错误日志 [userID] [接口名称] [当前调用的函数/当前做的操作] [error内容]
err = db.Model(&sql.UserInfo{}).Where("user_id = ?", userId).First(&feedUserInfo).Error
if err != nil {
   logx.Errorf("UserID: %v FeedLogic select feedUserInfo error:%v", userId, err)
   return nil, err
}
```

```go
// 接口的错误返回
db, err := sql.SqlConnect()
if err != nil {
   logx.Errorf("UserID: %v FeedLogic select feedUserInfo error:%v", userId, err)
   return &types.FeedHandlerResponse{
      StatusCode: 200,
      StatusMsg:  "feed video success",
   }, nil
}
```
```go
/*
 * 函数功能：token认证
 * 输入参数 TokenString:token的字符串形式
 * 返回值 flag:鉴权是否成功
 *        id:提取出的user_id
 */
 // 中文注释
```
