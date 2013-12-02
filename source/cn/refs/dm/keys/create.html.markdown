---
layout: refs/dm.cn
current_section: keys
title: ApiKey 创建 ｜ 数据存取
---

## 创建一个ApiKey

    POST /keys

```json
{
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
      "product_id": "951355e5fa56af20sa77c682",
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
```

### 响应

    201 Created

```json
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
      "product_id": "951355e5fa56af20sa77c682",
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
```
