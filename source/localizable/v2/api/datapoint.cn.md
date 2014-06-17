---
layout: docs
category: api
section: datapoint
toc: article
title: 数据点操作
---


## 获取数据点

```
GET /:db/datastreams/:id/datapoints
```

#### 参数
| 名称        | 类型    | 说明 |
| ---------- | ------  | ------------------------------------------------------ |
| start      | string/number | 起始时间。可以用[ISO_8601][iso8601]格式的字符串或 [Unix time][unix_time]的毫秒数表示。 |
| end        | string/number | 截止时间。可以用[ISO_8601][iso8601]格式的字符串或 [Unix time][unix_time]的毫秒数表示。 |
| order      | string  | 数据点的时间顺序。值可以为`asc`(从旧到新)或`desc`(从新到旧)。**默认值**为 `desc`。 |
| t          | string/number | 返回特定时间的数据点，若指定此参数则忽略 `start`, `end` 和 `order`。 |
| limit      | number | 数据点的个数的最大值。 |
| offset     | number | 数据点的个数的偏移量，与 `limit` 配合以达到分页的效果。注意：在数据量很大的时候用 `offset` 进行分页会十分耗时，推荐限定 `start` 和 `end` 来进行分段查询。 |
| chunked    | boolean| 以 [Chunked][chunked] 形式返回响应。当一次请求需要返回大量结果时，需要。**默认值**为`false`。 |

> 示例

```
/datastreams/51e51544fa36a48592000074/datapoints?start=2014-01-01T00:00:00.000+08:00&end=2014-01-04T00:00:00+08:00&order=asc
```

#### 响应

```
Status: 200 OK
```

```json
[
  [1400723585636, "info:api invoked"],
  [1400723585650, "info:body returned"]
]
```


## 创建数据点

```
POST /datastreams/:id/datapoints
```

#### 输入

最外层是一个 array，array 的每个元素是一个 hash，形式与[一次创建一个数据点][dp-1on1]中相同，如下表所示：

| 名称  | 类型    | 说明 |
| ----- | ------ | ------------------------------------------------------ |
| t     | string/number | 数据点的时间。可以用[ISO_8601][iso8601]格式的字符串或 [Unix time][unix_time]的毫秒数表示。**默认值**为当前时间。 |
| v     | valid json(number/string/hash/array/null) | 数据点的值。**默认值**为`null`。 |


> 示例

```json
[
  ["2014-01-03T00:00:01.004+08:00", 25],
  ["2014-01-03T00:00:02.004+08:00", 27]
]
```

#### 响应

```
Status: 201 Created
```

```json
[
  ["2014-01-03T00:00:01.004+08:00", 25],
  ["2014-01-03T00:00:02.004+08:00", 27]
]
```


## 删除数据点

```
DELETE /datastreams/:id/datapoints
```

#### 参数

| 名称  | 类型 | 说明 |
| ----- | ------ | --- |
| start | string | **必需**。 起始时间戳。格式遵循ISO 8601标准。 |
| end   | string | **必需**。 截止时间戳。格式遵循ISO 8601标准。 |
| t     | string/number | 返回特定时间的数据点，若指定此参数则忽略 `start`, `end` 和 `order`。 |

> 示例

```
/datastreams/51e51544fa36a48592000074/datapoints?start=2014-01-01T00:00:00.000+08:00&end=2014-01-04T00:00:00+08:00
```

#### 响应

```
Status: 204 No Content
```

[auth]: /docs/v1/basics/auth.html
[dp-1on1]: /v2/api/http/datapoint.html#4-1-一次创建一个数据点
[unix_time]: http://en.wikipedia.org/wiki/Unix_time
[iso8601]: http://en.wikipedia.org/wiki/ISO_8601
[chunked]: http://en.wikipedia.org/wiki/Chunked_transfer_encoding
