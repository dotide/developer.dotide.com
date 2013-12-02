---
layout: refs/dm.cn
current_section: keys
title: ApiKey罗列｜ 数据存取
---

## 列出所有ApiKeys

    GET /keys

### 响应

    200 OK

```json
[
  {
    "api_key": "d58f2d36656e75ff60279cfc5d294e2a42b904e3",
    "label": "MyPhone",
    "permissions": [
      "create",
      "read",
      "update",
      "delete",
      "list"
    ],
    "master": false,
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
