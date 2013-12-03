---
layout: api/dm.cn
current_section: datapoints
title: 数据点罗列｜ 数据存取
---

## 列出所有数据点

    GET /products/:product_id/devices/:device_serial/datastream/:datastream_name/datapoints

### 参数

| 名称  | 类型 | 说明 |
| ----- | ------ | --- |
| start | string | 起始时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| end   | string | 截止时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| order | string | 结果排序方式。值可以为"asc"(从旧到新)或者"desc"(从新到旧)。`order`默认为"desc" |


**示例**

```
/products/:product_id/devices/:device_serial/datastream/:datastream_name/datapoints?end=2013-06-05T23:50:32Z&order=desc&start=2013-06-05T23:50:32Z
```

### 响应

    Status: 200 OK

```json
[
  {
    "at": "2013-06-05T23:50:32Z",
    "value": 20
  },
  {
    "at": "2013-06-05T23:50:52Z",
    "value": 27
  }
]
```
