---
layout: cn_api
current_section: products
title: 产品读取 ｜ Dotide API
---

## Read a single product

    GET /products/:product

### Response

    200 OK

```json
{
  "id": "51e51544fa36a48592000074",
  "name": "Temperature Monitor",
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
```
