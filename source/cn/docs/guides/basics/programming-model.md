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

假设一个硬件有温度传感器，GPS 和显示屏。需要实时上传温度和位置，并更新显示消息。则可以建模成3条数据流：

`number` 型的 `device0_temperature` 和 `geojson` 型的 `device0_location` 用于设备上传数据, `string` 型的 `device0_message` 用于设备下载数据。

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

上传温度数据：

```
POST /datastreams/device0_temperature/datapoints
```
```json
[
  {
    "t": "2014-01-01T01:00:00.000+08:00",
    "v": 20
  }, {
    "t": "2014-01-01T02:00:00.000+08:00",
    "v": 30
  }, {
    "t": "2014-01-01T03:00:00.000+08:00",
    "v": 10
  }
]
```

获取当前消息：

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

响应的 body 中， `current_v` 的值就是数据流最新的数据点的值，即 “WELL DONE”。

如果有大量这种型号的硬件，最好给每个数据流打上标签以便查找，比如给所有的温度传感器打上 `temperature` 的标签，就可以很方便地列出所有温度数据流：

```
GET /datastreams?tags=temperature
```

### 基本架构

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


[security]: /cn/docs/guides/basics/security.html