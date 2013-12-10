---
layout: api/trigger.cn
current_section: list
title: 罗列｜ 触发器
---

## 列出所有触发器

    GET /triggers

### 参数

| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| product_id     | string | 产品id。 |
| device_serial  | string | 设备序列号。 |
| datastream_name| string | 数据流标识。 |

**示例**

```
/triggers?product_id=51355e5fa56af20sa77c682&device_serial=516498&datastream_name=demostream
```

### 响应

    Status: 200 OK

```json
[
  {
    "id": "52122490fa36a479150000e7",
    "type": "gt",
    "param": 40,
    "action": "webhook",
    "config": {
      "url": "http://example.com",
      "headers": {
        "user-agent": "Dotide"
      }
    }
    "edge": true,
    "product_id": "51355e5fa56af20sa77c682",
    "device_serial": "516498",
    "datastream_name": "demostream"
  }
]
```
