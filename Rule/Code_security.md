# 项目安全的注意事项

# 1. SQL注入
关于程序的SQL注入问题，Gorm框架语言自带了预编译功能，可以避免SQL注入，因此注意以下三点：

    1、不要使用dao.db.Raw(sql)查询
    2、不要直接使用fmt.Sprintf执行SQL语句
    3、避免在查询过程中使用字符串拼接
