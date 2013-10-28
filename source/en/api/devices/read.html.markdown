---
layout: en_api
current_section: devices
title: Read Devices ｜ Dotide API
---

## Read a Device

    GET /products/:product/devices/:device_serial

### Response

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
