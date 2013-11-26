---
layout: cn_api
current_section: devices
title: 设备创建 ｜ Dotide API
---

## 创建设备(单个)

    POST /products/:product/devices
    
```json
{"serial": "AFKDJK-UIJSJK"}
```

### 响应

    201 Created

## 创建设备(批量)

    POST /products/:product/devices

```json
[
  {"serial": "AFKDJK-UIJSJK"},
  {"serial": "MKUIJI-MKJKUK"}
]
```

### 响应

    201 Created
