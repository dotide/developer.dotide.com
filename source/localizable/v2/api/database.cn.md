---
layout: docs
category: api
section: database
toc: article
title: 数据库操作
---

## 读取数据库属性

```
GET /:db
```

#### 响应

```
Status: 200 OK
```

```json
{
  "name": "demo",
  "public": false,
  "time_format": "unix",
  "time_zone": "Asia/Shanghai",
  "datastreams_count": 10000,
  "datapoints_count": 1032320023,
  "read_count": 211212,
  "write_count": 1213
}
```

## 更新数据库属性

```
PUT /:db
```

#### 输入

| 名称        | 类型             | 说明 |
| ---------- | ---------------- | ------------ |
| public     | boolean          | 是否为公开数据库。`true` 为公开，`false` 为私有。 |
| time_format | string           | 该数据库中，默认的时间表示方式。**可选** `unix`, `iso`。`unix`：时间用 [Unix time][unix_time] 的毫秒数表示。`iso`：时间用 [ISO_8601][iso8601] 格式的字符串表示。 |
| time_zone   | string           | 该数据库中，[ISO_8601][iso8601] 方式表示时间时，默认所使用的时区。具体的时区值详见 [Olson 数据库][olson]。 |

数据库为公开时，所存储数据的读取不需要认证信息。

> 示例

```json
{
  "public": true,
  "time_format": "unix",
  "time_zone": "Asia/Shanghai"
}
```

#### 响应

```
Status: 200 OK
```

```json
{
  "name": "demo",
  "public": true,
  "time_format": "unix",
  "time_zone": "Asia/Shanghai",
  "datastreams_count": 10000,
  "datapoints_count": 1032320023,
  "read_count": 211212,
  "write_count": 1213
}
```

[auth]:/v2/auth/overview.html
[olson]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
[unix_time]: http://en.wikipedia.org/wiki/Unix_time
[iso8601]: http://en.wikipedia.org/wiki/ISO_8601
