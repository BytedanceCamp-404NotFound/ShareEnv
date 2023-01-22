# 404NotFound的go编码规范

大驼峰？

1. 文件名命名
   1. 全部使用大驼峰？
2. 函数命名
    1. 不允许一个单词
       1. func Connect(database string, 
3. 统一注释风格
    1. 函数名字前// XXXX
    2. 使用中文
 4. 日志打印
    1. logx
    2. 具体打印的信息



```go
/*
 * 函数功能：token认证
 * 输入参数 TokenString:token的字符串形式
 * 返回值 flag:鉴权是否成功
 *        id:提取出的user_id
 */
```
