---
layout: docs/guides.cn
section: basics
page: data
title: 数据存取
outlines:
  - 数据建模
---

## 数据建模

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

更详细的操作请移步 [API 参考手册][api_ref]及[ SDK 文档][sdk]。


[postman]: https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm
[create_datastream]: /docs/refs/data/datastream.html#3-创建数据流
[create_datapoints]: /docs/refs/data/datapoint.html#3-创建数据点
[list_datapoints]: /docs/refs/data/datapoint.html#2-查询数据点
[api_ref]: /docs/refs/index.html
[sdk]: /docs/libraries/index.html
