---
layout: cn_api
current_section: devices
title: 设备创建 ｜ Dotide API
---

## Create Devices

    POST /products/:product/devices

~~~json
{
  devices: [
    {"serial": "123456"},
    {"serial": "234567"}
  ]
}
~~~

### Response

    201 Created

## Read a Device

    GET /products/:product/devices/:device_serial

### Response

    200 OK

~~~json
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
~~~

