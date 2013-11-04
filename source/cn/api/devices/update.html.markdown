---
layout: cn_api
current_section: devices
title: 设备更新 ｜ Dotide API
---

## 更新一个设备

    PUT /products/:product/devices/:device_serial

```json
{
    "title": "New Name"
}
```

### 响应

    200 OK

```json
{
  "serial": "123456",
  "title": "New Name",
  "description": "a temperature monitor.",
  "private": true,
  "status": "live",
  "created_at": "2013-07-16T16:36:51Z",
  "updated_at": "2013-07-16T16:36:51Z",
  "tags": [
    "demo",
    "temperature"
  ],
  "properties": {
    "prop1": "abc"
  }
  "location": {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [118.82, 31.89]
    },
    "properties": {
      "name" : "home"
    },
    "updated_at": "2013-07-16T16:36:51Z"
  }
}
```
