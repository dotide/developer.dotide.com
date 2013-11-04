---
layout: cn_api
current_section: datastreams
title: 数据流读取｜ Dotide API
---

## 读取一个数据流

    GET /products/:product/devices/:device_serial/datastreams/:datastream_name

### 响应

    200 OK

```json
{
  "name": "demostream",
  "type": "number",
  "properties": {
    "unit_name": "Celsius",
    "unit_symbol": "C",
  }
  "current_value": 20,
  "tags": ["temperature"],
  "updated_at": "2013-07-13T15:31:22Z"
}
```
