---
layout: cn_api
current_section: datastreams
title: 数据流列表｜ Dotide API
---

## 列出所有数据流

    GET /products/:product/devices/:serial/datastreams

### 响应

    200 OK

```json
[
  {
    "name": "demostream",
    "type": "number",
    "unit_name": "Celsius",
    "unit_symbol": "C",
    "current_value": 20,
    "tags": ["temperature"],
    "updated_at": "2013-07-13T15:31:22Z"
  }
]
```
