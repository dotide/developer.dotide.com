---
layout: cn_api
current_section: devices
title: 设备创建 ｜ Dotide API
---

## Create Devices

    POST /products/:product/devices

```json
{
  "devices": [
    {"serial": "123456"},
    {"serial": "234567"}
  ]
}
```

### Response

    201 Created
