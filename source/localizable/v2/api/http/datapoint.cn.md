---
layout: docs
category: api
section: http
title: 数据点
outlines:
  - 权限验证
  - 读取数据点
  - 创建数据点
  - 删除数据点
---

## 权限验证

数据点操作需要通过 [Access Token][auth] 或 [Basic][auth] 认证授权。


## 查询数据点

```
GET /datastreams/:id/datapoints
```

### 参数
| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| start      | string | 起始时间戳。格式遵循ISO 8601标准，例如`2014-01-03T20:14:13.123+08:00`。 |
| end        | string | 截止时间戳。格式遵循ISO 8601标准。 |
| order      | string | 数据点的时间顺序。值可以为`asc`(从旧到新)或`desc`(从新到旧)。**默认值**为 `desc`。 |
| t          | string | 返回特定时间的数据点，若指定此参数则忽略 `start`, `end` 和 `order`。 |
| limit      | number | 数据点的个数的最大值。 |
| offset     | number | 数据点的个数的偏移量，与 `limit` 配合以达到分页的效果。注意：在数据量很大的时候用 `offset` 进行分页会十分耗时，推荐限定 `start` 和 `end` 来进行分段查询。 |
| summary    | int    | 是否返回数据的统计值，仅针对 `number` 型的数据流有效。可选值为`0`或`1`。**默认值**为`0`。 |
| interval   | int    | 采样的时间间隔，单位为毫秒。`0`表示不进行采样，返回所有数据点。**默认值**为`0`。 |
| function   | string | 采样函数。可选 `avg`, `sum`, `max`, `min`, `count`。**默认值**为 `avg`。 |
| tz         | string | 指定时区。**默认值**为 `Asia/Shanghai`。 |

**示例**

```
/datastreams/51e51544fa36a48592000074/datapoints?start=2014-01-01T00:00:00.000+08:00&end=2014-01-04T00:00:00+08:00&order=asc&summary=1
```

### 响应

```
Status: 200 OK
```

```json
{
  "id": "51e51544fa36a48592000074",
  "datapoints": [
    {
      "t": "2014-01-03T00:00:01.000+08:00",
      "v": 10
    },
    {
      "t": "2014-01-03T00:30:20.000+08:00",
      "v": 20
    }
  ],
  "options": {
    "start": "2014-01-01T00:00:00.000+08:00",
    "end": "2014-01-04T00:00:00+08:00",
    "order": "asc",
    "interval": 0,
    "function": "avg",
    "summary": 1,
    "tz": "Asia/Shanghai"
  },
  "summary": {
    "count": 2,
    "max": 20,
    "min": 10,
    "sum": 30,
    "avg": 15
  }
}
```


## 创建数据点

```
POST /datastreams/:id/datapoints
```

### 输入

| 名称  | 类型    | 说明 |
| ----- | ------ | ------------------------------------------------------ |
| t     | string | 时间戳。格式遵循ISO 8601标准。**默认值**为当前时间。 |
| v     | string/number/object(GeoJSON)/null | 数据点的值，数据类型须符合数据流指定的类型。例如：number`20.5`，string`"something"`，object([GeoJSON][geojson])(详见示例)。**默认值**为`null`。 |


**示例**

`创建单个数据点:`

```json
{
  "t": "2014-01-03T00:00:01.001+08:00",
  "v": 20
}
```

`创建多个数据点:`

```json
[
  {
    "t": "2014-01-03T00:00:01.004+08:00",
    "v": 25
  },
  {
    "t": "2014-01-03T00:00:02.001+08:00",
    "v": 27
  }
]
```

`创建GeoJSON数据点：`

```json
{
  "t": "2014-01-03T00:00:02.001+08:00",
  "v": {
    "type": "Point",
    "coordinates": [118.82, 31.89]
  }
}
```

### 响应

`创建单个数据点:`

```
Status: 201 Created
```

```json
{
  "t": "2014-01-03T00:00:01.001+08:00",
  "v": 20
}
```

`创建多个数据点:`

```
Status: 201 Created
```

```json
[
  {
    "t": "2014-01-03T00:00:01.004+08:00",
    "v": 25
  },
  {
    "t": "2014-01-03T00:00:02.001+08:00",
    "v": 27
  }
]

```

`创建GeoJSON数据点：`

```
Status: 201 Created
```

```json
{
  "t": "2014-01-03T00:00:02.001+08:00",
  "v": {
    "type": "Point",
    "coordinates": [118.82, 31.89]
  }
}
```


## 删除数据点

```
DELETE /datastreams/:id/datapoints
```

### 参数

| 名称  | 类型 | 说明 |
| ----- | ------ | --- |
| start | string | **必需**。 起始时间戳。格式遵循ISO 8601标准。 |
| end   | string | **必需**。 截止时间戳。格式遵循ISO 8601标准。 |

**示例**

```
/datastreams/51e51544fa36a48592000074/datapoints?start=2014-01-01T00:00:00.000+08:00&end=2014-01-04T00:00:00+08:00
```

### 响应

```
Status: 204 No Content
```


[auth]: /docs/v1/basics/auth.html
[geojson]: http://geojson.org/
