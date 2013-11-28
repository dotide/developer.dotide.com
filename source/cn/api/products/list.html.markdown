---
layout: cn_api
current_section: products
title: 产品罗列 ｜ Dotide API
---

## 列出所有产品

    GET /products

### 响应

    Status: 200 OK

```json
[
  {
    "id": "51e51544fa36a48592000074",
    "name": "Temperature Monitor",
    "description": "A demo device for temperature monitor.",
    "state": "deploy",
    "devices_count": 10,
    "activated_devices_count": 2,
    "device_template": {
      "title": "王迪的iPhone 10",
      "description": "王迪自制的iPhone",
      "private": true,
      "tags": [
        "demo",
        "temperature"
      ],
      "properties": {
        "prop1": "abc"
      },
      "location": {
        "type": "Feature",
        "geometry": {
          "type": "Point",
          "coordinates": [118.82, 31.89]
        },
        "properties": {
          "name" : "home"
        }
      },
      "datastreams": [
        {
          "name": "icetemp",
          "annotation": "冰箱温度值",
          "type": "number",
          "tags": ["temperature"],
          "properties": {
            "unit_name": "摄氏度",
            "unit_symbol": "C"
          }
        }
      ]
    }
  }
]
```
