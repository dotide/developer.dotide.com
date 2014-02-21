---
layout: api/dm.cn
current_section: datapoints
title: 数据点罗列｜ Dotide DB
---

## 列出所有数据点

    GET /datastreams/:id/datapoints

### 参数

| 名称  | 类型 | 说明 |
| ----- | ------ | --- |
| start | string | 起始时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| end   | string | 截止时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| order | string | 结果排序方式。值可以为"asc"(从旧到新)或者"desc"(从新到旧)。`order`默认为"desc" |
| tz    | string | 时区。 |
| limit | integer | 对查询结果的数量限制。 |
| skip  | integer | 跳过结果的数量。 |
| interval | integer | 采样间隔时间。 |
| function | string | 采样函数，可选max，min，sum，avg。 |
| summary | integer | 是否返回统计结果，“0”不返回，“1”不返回（默认）。 |



**示例**

```
/datastreams/:id/datapoints?end=2014-01-03T01:00:00Z&order=desc&start=2014-01-03T00:00:00Z
```

### 响应

    Status: 200 OK

```json
{
  "datastream_id": "51e51544fa36a48592000074",
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
