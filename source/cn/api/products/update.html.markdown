---
layout: cn_api
current_section: products
title: 产品更新 ｜ Dotide API
---

## Update a single product

    PUT /products/:product

~~~json
{
    "name": "New Name"
}
~~~

### Response

    200 OK

~~~json
{
  "id": "51e51544fa36a48592000074",
  "name": "New Name",
  "description": "A temperature monitor.",
  "state": "deploy",
  "devices_count": 0,
  "activated_devices_count": 0,
  "device_template": {
    "title": "Demo Device",
    "description": "a temperature monitor.",
    "tags": [
      "demo",
      "temperature"
    ],
    "private": true,
    "datastreams": [
      {
        "name": "demostream",
        "type": "number",
        "unit_name": "Celsius",
        "unit_symbol": "C",
        "tags": [
          "temperature"
        ]
      }
    ]
  }
}
~~~
