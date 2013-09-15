---
layout: cn_api
current_section: devices
title: 设备创建 ｜ Dotide API
---

## 创建设备(批量)

    POST /products/:product/devices

```json
{
  "devices": [
    {"serial": "123456"},
    {"serial": "234567"}
  ]
}
```

### 响应

    201 Created
