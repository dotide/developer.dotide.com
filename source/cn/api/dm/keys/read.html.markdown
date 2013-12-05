---
layout: api/dm.cn
current_section: keys
title: Key读取｜ 数据存取
---

## 读取一个Key

    GET /keys/:key_kid

### 响应

    Status: 200 OK

```json
{
  "kid": "5b1d87bec76c6cb308e95313b29b99148f7eac5a",
  "label": "MyPhone",
  "permissions": [
    "write"
  ],
  "global": false,
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
