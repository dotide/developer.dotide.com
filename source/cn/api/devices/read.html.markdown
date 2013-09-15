---
layout: cn_api
current_section: devices
title: 设备读取 ｜ Dotide API
---

## 读取一个设备

    GET /products/:product/devices/:device_serial

### 响应

    200 OK

```json
{
  "serial": "123456",
  "title": "Demo Device",
  "description": "a temperature monitor.",
  "private": true,
  "status": "live",
  "created_at": "2013-07-16T16:36:51Z",
  "updated_at": "2013-07-16T16:36:51Z",
  "tags": [
    "demo",
    "temperature"
  ],
  "location": {
    "name": "Home",
    "lat": 67,
    "lon": 12,
    "ele": 4,
    "updated_at": "2013-07-16T16:36:51+08:00"
  }
}
```
