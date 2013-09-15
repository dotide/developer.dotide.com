---
layout: cn_api
current_section: datastreams
title: 数据流更新｜ Dotide API
---

## 更新一个数据流

    PUT /products/:product/devices/:device_serial/datastreams/:datastream_name

```json
{
  "name": "New Name"
}
```

### 响应

    200 OK

```json
{
  "name": "New Name",
  "type": "number",
  "unit_name": "Celsius",
  "unit_symbol": "C",
  "current_value": 20,
  "tags": ["temperature"],
  "updated_at": "2013-07-13T15:31:23Z"
}
```
