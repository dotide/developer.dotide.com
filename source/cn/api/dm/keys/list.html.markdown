---
layout: api/dm.cn
current_section: keys
title: Key罗列｜ Dotide DB
---

## 列出所有Keys

    GET /keys

### 参数

| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| product_id     | string | 产品id。 |
| device_serial  | string | 设备序列号。 |
| datastream_name| string | 数据流标识。 |

**示例**

```
/keys?product_id=51355e5fa56af20sa77c682&device_serial=516498&datastream_name=demostream
```

### 响应

    Status: 200 OK

```json
[
  {
    "kid": "5b1d87bec76c6cb308e95313b29b99148f7eac5a",
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
