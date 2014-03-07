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
```

### 参数
| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| id         | string | 所属数据流的id。 |
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
