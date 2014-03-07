---
layout: docs/refs.cn
section: data
page: datapoint
title: 数据点
outlines:
  - 权限验证
  - 查询数据点
  - 创建数据点
  - 删除数据流
---

## 权限验证

数据流操作支持[Basic Auth][basic_auth]和[OAuth][oauth]两种形式

## 查询数据点

```
GET /datastreams/:id/datapoints

注：:id为所属数据流的id。
```

### 参数
| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| start      | string | 起始时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| end        | string | 截止时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| order      | string | 结果的排序方式。值可以为"asc"(从旧到新)或者"desc"(从新到旧)。`order`默认为"desc" |
| limit      | number | 本次请求返回数据点的个数的最大值。 |
| offset     | number | 本次请求返回数据点，需要跳过开头的offset个。 |

**示例**

```
/datastreams/51e51544fa36a48592000074/datapoints?end=2013-06-05T23:50:32Z&start=2013-06-05T23:50:32Z&order=desc
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
      "t": "2014-01-03T00:00:01Z",
      "v": 10
    },
    {
      "t": "2014-01-03T00:30:20Z",
      "v": 20
    }
  ],
  "options": {
    "start": "2014-01-03T00:00:00Z",
    "end": "2014-01-03T01:00:00Z",
    "tz": "UTC",
    "order": "asc",
    "limit": 100,
    "skip": 0,
    "interval": 60,
    "function": "avg",
    "summary": true
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

注：:id为所属数据流的id。
```

### 输入

| 名称  | 类型    | 说明 |
| ----- | ------ | ------------------------------------------------------ |
| t     | string | **必需[注1]**。 时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| v     | string/number/object(GeoJSON) | **必需[注2]**。 数据点的值。例如：number`20.5`，string`"something"`，object(GeoJSON)(详见示例)。 |

*注1：*当创建单个数据点的时候，可以没有`t`值。这样意味着以接受到该请求的时刻作为该数据点的`t`值。

*注2：*如果`v`为数值型，或者符合[GeoJSON][geojson]格式并且是Point类型的Feature(如下面示例所示)，则可以在Dotide站点上直接以图表或地图的形式展现数据。

**示例(number)**

`创建单个数据点:`

```json
{
  "t": "2013-06-05T23:50:32Z",
  "v": 20
}
```

`创建多个数据点:`

```json
[
  {
    "t": "2013-06-05T23:53:32Z",
    "v": 25
  },
  {
    "t": "2013-06-05T23:55:60Z",
    "v": 27
  }
]
```

### 响应

`创建单个数据点:`

    Status: 201 Created

```json
{
  "t": "2013-06-05T23:50:32Z",
  "v": 20
}
```

`创建多个数据点:`

    Status: 201 Created
    
```json
[
  {
    "t": "2013-06-05T23:53:32Z",
    "v": 25
  },
  {
    "t": "2013-06-05T23:55:60Z",
    "v": 27
  }
]

```

**示例(object(GeoJSON))**

`创建单个数据点:`

```json
{
  "t": "2013-06-05T23:57:32Z",
  "v": {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [118.82, 31.89]
    }
  }
}
```

`创建多个数据点:`

```json
[{
  "t": "2013-06-05T23:58:32Z",
  "v": {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [119.32, 32.04]
    }
  }
},
  {
  "t": "2013-06-05T23:59:32Z",
  "v": {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [119.87, 32.36]
    }
  }
}]

```

### 响应

`创建单个数据点:`

    Status: 201 Created

```json
{
  "t": "2013-06-05T23:57:32Z",
  "v": {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [118.82, 31.89]
    }
  }
}
```

`创建多个数据点:`

```json
[{
  "t": "2013-06-05T23:58:32Z",
  "v": {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [119.32, 32.04]
    }
  }
},
  {
  "t": "2013-06-05T23:59:32Z",
  "v": {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [119.87, 32.36]
    }
  }
}]

```

## 删除数据点

```
DELETE /datastreams/:id


注：:id为所属数据流的id。
```

### 参数

| 名称  | 类型 | 说明 |
| ----- | ------ | --- |
| start | string | **必需**。 起始时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| end   | string | **必需**。 截止时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |

**示例**

```
/datastreams/51e51544fa36a48592000074/datapoints?end=2013-06-05T23:59:59Z&start=2013-06-05T23:50:32Z
```

### 响应

    Status: 204 No Content

[basic_auth]: /cn/docs/refs/auth/basic-auth.html
[oauth]: /cn/docs/refs/auth/oauth.html
[geojson]: http://geojson.org/