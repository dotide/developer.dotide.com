---
layout: cn_api
current_section: datastreams
title: 数据流创建｜ Dotide API
---

## 创建一个数据流

    POST /products/:product/devices/:device_serial/datastreams

```json
{
  "name": "demostream",
  "type": "number",
  "tags": ["temperature"],
  "properties": {
    "unit_name": "Celsius",
    "unit_symbol": "C",
  }
}
```

### 响应

    201 Created

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

