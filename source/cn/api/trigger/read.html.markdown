---
layout: api/trigger.cn
current_section: read
title: 读取｜ 触发器
---

## 读取一个触发器

    GET /triggers/:trigger_id

### 响应

    Status: 200 OK

```json
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
  },
  "edge": true,
  "active": true,
  "triggered": true,
  "product_id": "51355e5fa56af20sa77c682",
  "device_serial": "516498",
  "datastream_name": "demostream"
}
```
