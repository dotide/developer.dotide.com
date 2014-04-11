---
layout: docs/guides.cn
section: basics
page: programming-model
title: 编程模型
outlines:
  - 基本架构
  - 数据流程
---

为了帮助开发者更合理地利用 Dotide 进行开发，这里给出一些编程模型上的建议。

## 基本架构

正常使用 Doitde 应该是如下架构：

```
Dotide --管理授权-- 用户服务器
   \               /
    \             /
     \       传送元数据及授权
上传或下载数据     /
       \       /
        \     /
         客户端
```

Dotide 提供时序数据存储服务，向用户服务器提供数据的管理服务，向客户端提供数据的上传和下载服务。

开发者应自己维护一个服务器，用来生成和管理 Access Token （见[安全机制][security]），这一个过程不能在客户端上进行，否则会产生安全风险。还要管理数据的映射关系，比如你的应用中某个传感器对应于 Dotide 中的哪个数据流。

客户端在用户服务器获取元数据及授权信息后，可以到 Dotide 进行上传或下载数据。

若只是用于个人使用或测试的话，可以不需要用户服务器，直接与 Dotide 进行通信，开发者应该清楚基本架构，选择合适的技术去构建应用。


## 数据流程

### 上传

向 Dotide 上传数据分两种情况，在开发者信任的安全环境（如开发者的服务器）与不受信任的环境（如客户端，浏览器）。

在安全环境下，可以通过 Basic 认证，使用 `client_id` 作为 `username`，`client_secret` 作为 `password`，直接向 Dotide 发起请求。

在不受信任的环境下，应该通过 Token 认证来发请求，开发者应该安全环境下向 Dotide 发请求生成 `access_token`，分发给客户端，然后客户端再使用 `access_token`来向 Dotide 发起请求。

### 下载

如果数据库设置为 `public`， 则不需要认证，直接发请求即可。否则下载流程与上传流程相同。


[create_datastream]: /docs/refs/data/datastream.html#3-创建数据流
[create_datapoints]: /docs/refs/data/datapoint.html#3-创建数据点
[list_datapoints]: /docs/refs/data/datapoint.html#2-查询数据点
[api_ref]: /docs/refs/index.html
[sdk]: /docs/libraries/index.html
[postman]: https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm
[security]: /docs/guides/basics/security.html
