---
layout: en_api
current_section: devices
title: Update Devices ｜ Dotide API
---

## Update a Device

    PUT /products/:product/devices/:device_serial

```json
{
    "title": "New Name"
}
```

### Response

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
  "location": {
    "name": "Home",
    "lat": 67,
    "lon": 12,
    "ele": 4,
    "updated_at": "2013-07-16T16:36:51+08:00"
  }
}
```
