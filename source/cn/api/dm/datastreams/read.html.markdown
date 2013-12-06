---
layout: api/dm.cn
current_section: datastreams
title: 数据流读取｜ Dotide DB
---

## 读取一个数据流

    GET /products/:product_id/devices/:device_serial/datastreams/:datastream_name

### 响应

    Status: 200 OK

```json
{
  "name": "icetemp",
  "annotation": "冰箱温度值",
  "type": "number",
  "tags": ["temperature"],
  "properties": {
    "unit_name": "摄氏度",
    "unit_symbol": "C",
  }
  "current_value": 20,
  "tags": ["temperature"],
  "updated_at": "2013-07-13T15:31:22Z"
}
```
