---
layout: docs/guides.cn
section: basics
page: programming-model
title: 编程模型
---

## 编程模型

为了帮助开发者更合理地利用 Dotide 进行开发，这里给出一些编程模型上的建议。

### 数据建模

使用 Dotide 的第一步应该对要处理的数据进行建模，下面举个例子来说明。

假设一个硬件有温度传感器，GPS 和显示屏。需要实时上传温度和位置，并更新显示消息。

假设有如下数据：

```
temperature:
2014-01-01T01:00:00.000+08:00 20
2014-01-01T02:00:00.000+08:00 30
2014-01-01T03:00:00.000+08:00 10

location:
2014-01-01T01:00:00.000+08:00 {"type": "Point", "coordinates": [125.6, 10.1]}`
2014-01-01T02:00:00.000+08:00 {"type": "Point", "coordinates": [126.6, 10.1]}`
2014-01-01T03:00:00.000+08:00 {"type": "Point", "coordinates": [127.6, 10.1]}`

message:
2014-01-01T01:00:00.000+08:00 "HELLO DOTIDE"
2014-01-01T02:00:00.000+08:00 "HAVE FUN"
2014-01-01T03:00:00.000+08:00 "WELL DONE"
```

其中温度（`temperature`）和位置（`location`）数据需要实时上传，消息（`message`）需要获取最新的一条消息并显示。

首先在控制台界面创建数据库，给数据库命名，这里以 `demo` 为例。创建数据库之后会得到 `client_id` 和 `client_secret`，在一会的认证中会用到。

然后我们对数据进行建模，这些数据可以对应3条数据流，给设备编个号以便扩展，这里以`0`为例：

`number` 型的 `0_temperature` 和 `geojson` 型的 `0_location` 用于设备上传数据, `string` 型的 `0_message` 用于设备下载数据。

推荐使用 Chrome 的插件 [Postman][postman] 进行测试，也可以使用 `curl` 进行命令行操作。以 `curl` 为例：
先创建这三个数据流，要用到[创建数据流][create_datastream]的 API：

```
$ curl -i -u client_id -d '{"id": "0_temperature", "type": "number"}' -H "Content-Type: application/json"  https://api.dotide.com/v1/demo/datastreams
```

将`client_id` 和 `demo` 替换成你得到的值，并输入 `client_secret`。同理，创建 `0_location` 与 `0_message`，注意 `type` 的值要匹配。

接下来要操作数据点，上传温度数据要用到[创建数据点][create_datapoints] 的 API：

```
$ curl -i -u client_id -d '{"t": "2014-01-01T01:00:00.000+08:00", "v": 20}' -H "Content-Type: application/json"  https://api.dotide.com/v1/demo/datastreams/0_temperature/datapoints
```

查看已经上传的数据点，可以通过[查询数据点][list_datapoints]的 API：

```
$ curl -i -u client_id https://api.dotide.com/v1/demo/datastreams/0_temperature/datapoints
```

可以用相同的方式上传其他数据。若想获取某个数据流的最新数据点信息，不需要去查询数据点，因为最新的数据点信息会自动同步到数据流的元信息中，获取当前消息：

```
GET /datastreams/device0_message
```

响应的 body：

```json
{
    "id": "device0_message",
    "name": "message",
    "type": "string",
    "tags": [],
    "properties": {},
    "current_t": "2014-01-01T03:00:00.000+08:00",
    "current_v": "WELL DONE",
    "created_at": "2014-01-01T00:00:00.000+08:00",
    "updated_at": "2014-01-01T03:00:01.000+08:00"
}
```

响应的 body 中， `current_v` 的值就是数据流最新的数据点的值，即 “WELL DONE”， `current_t` 的值是该数据点的 `t`。

如果有大量这种型号的硬件，最好给每个数据流打上标签以便查找，比如给所有的温度传感器打上 `temperature` 的标签，就可以很方便地列出所有温度数据流：

```
GET /datastreams?tags=temperature
```

更详细的操作请移步 [API 参考手册][api_ref]及[SDK][sdk]。

### 基本架构

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

### 数据流程

#### 上传

向 Dotide 上传数据分两种情况，在开发者信任的安全环境（如开发者的服务器）与不受信任的环境（如客户端，浏览器）。

在安全环境下，可以通过 Basic 认证，使用 `client_id` 作为 `username`，`client_secret` 作为 `password`，直接向 Dotide 发起请求。

在不受信任的环境下，应该通过 Token 认证来发请求，开发者应该安全环境下向 Dotide 发请求生成 `access_token`，分发给客户端，然后客户端再使用 `access_token`来向 Dotide 发起请求。

#### 下载

如果数据库设置为 `public`， 则不需要认证，直接发请求即可。否则下载流程与上传流程相同。


[create_datastream]: /cn/docs/refs/data/datastream.html#para-2
[create_datapoints]: /cn/docs/refs/data/datapoint.html#para-2
[list_datapoints]: /cn/docs/refs/data/datapoint.html#para-1
[api_ref]: /cn/docs/refs/index.html
[sdk]: /cn/docs/libraries/index.html
[postman]: https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm
[security]: /cn/docs/guides/basics/security.html