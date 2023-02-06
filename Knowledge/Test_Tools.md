# 关于并发测试

> **推荐大家一点简单的网络测试工具：BIND9、traceroute、tracert**  
> **推荐大家一点简单的业务测试工具：curl、openssl**  
> **推荐大家一些手机上可以使用上面推荐的工具的软件：Termux、ish**  

**上面那些是我看飞书有人推荐的，实际上我觉得postman就可以了，但是postman的多样例测试比较麻烦，大家可以试试Apifox ，有自动化测试功能，也支持多线程:**

![1](https://s3.bmp.ovh/imgs/2023/02/07/24a7bc1512470963.jpg)

## pprof

**然后还有就是之前课程学过的 pprof 工具，**[https://zhuanlan.zhihu.com/p/396363069](https://zhuanlan.zhihu.com/p/396363069) 这里有具体步骤

**但是我们是go - zero 框架 接入改的代码不一样，下面是go-zero的pprof接入在baseinterface.go的文件修改：**

```
package main

import (
    "SimpleTikTok/external_api/baseinterface/internal/config"
    "SimpleTikTok/external_api/baseinterface/internal/handler"
    "SimpleTikTok/external_api/baseinterface/internal/svc"
    "flag"
    "fmt"
    "log"
    "net/http"

    "github.com/zeromicro/go-zero/core/conf"
    "github.com/zeromicro/go-zero/core/service"
    "github.com/zeromicro/go-zero/rest"
)

var configFile = flag.String("f", "etc/baseinterface.yaml", "the config file")

func main() {
    flag.Parse()

    var c config.Config
    conf.MustLoad(*configFile, &c)
    svcGroup := service.NewServiceGroup()
    defer svcGroup.Stop()
    ctx := svc.NewServiceContext(c)
    server := rest.MustNewServer(c.RestConf)
    svcGroup.Add(server)
    handler.RegisterHandlers(server, ctx)
    fmt.Printf("Starting server at %s:%d...\n", c.Host, c.Port)
    svcGroup.Add(pprofServer{})
    svcGroup.Start()
}

type pprofServer struct{}

func (pprofServer) Start() {
    addr := "127.0.0.1:39599"
    fmt.Printf("Start pprof server, listen addr %s\n", addr)
    err := http.ListenAndServe(addr, nil)
    if err != nil {
        log.Fatal(err)
    }
}

func (pprofServer) Stop() {
    fmt.Printf("Stop pprof server\n")
}

```

**大家可以试一下调整端口 我这个监听出来的**火焰图**似乎没有读取到应该有的效果

![](https://s3.bmp.ovh/imgs/2023/02/07/2ad7e7afd154b270.png)


## 全链路压测

我在网上找了一下，开源的全链路压测似乎只有Takin 要使用docker安装 对虚拟机的配置要求较高 我安装完以后初始界面就显示不正常 你们可以试试看 https://docs.shulie.io/docs/opensource/opensource-1d40ib39m90bu

![](https://s3.bmp.ovh/imgs/2023/02/07/4b79074ff4427d58.png)
