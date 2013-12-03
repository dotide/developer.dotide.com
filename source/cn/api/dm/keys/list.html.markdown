---
layout: api/dm.cn
current_section: keys
title: Key罗列｜ 数据存取
---

## 列出所有Keys

    GET /keys

### 响应

    Status: 200 OK

```json
[
  {
    "id": "51e51544fa36a48592000066",
    "label": "MyPhone",
    "permissions": [
      "read",
      "write"
    ],
    "global": false,
    "resources": [
      {
        "product_id": "51355e5fa56af20sa77c682",
        "device_serial": "516498",
        "datastream_name": "demostream"
      },
      {
        "product_id": "51e51544fa36a48592000074",
        "device_serial": "953786"
      },
      {
        "product_id": "52122490fa36a479150000e7"
      }
    ]
  }
]
```
