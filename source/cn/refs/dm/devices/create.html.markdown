---
layout: refs/dm.cn
current_section: devices
title: 设备创建 ｜ 数据存取
---

## 创建设备

    POST /products/:product/devices

### 输入

| 名称  | 类型     | 说明 |
| ------ | ------ | ------------------------------------------------------ |
| serial | string | **必需的**。 设备序列号。用来标识一个产品下不同的设备。要求：同一个产品下唯一。 |

**示例**

`创建单个设备:`

```json
{
  "serial": "AFKDJK-UIJSJK"
}
```

`创建多个设备:`

```json
[
  {"serial": "AFKDJK-UIJSJK"},
  {"serial": "MKUIJI-MKJKUK"}
]
```
### 响应

`创建单个设备:`

    Status: 201 Created
    Location: http://api.dotide.com/v1/products/51e51544fa36a48592000074/devices/AFKDJK-UIJSJK

```json
{
  "serial": "AFKDJK-UIJSJK",
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
  },
  "location": {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [118.82, 31.89]
    },
    "properties": {
      "name": "home"
    },
    "updated_at": "2013-07-16T16:36:51Z"
  }
}
```

`创建多个设备:`

    Status: 201 Created
    Location: http://api.dotide.com/v1/products/51e51544fa36a48592000074/devices

```json
[
  {
    "serial": "AFKDJK-UIJSJK",
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
    },
    "location": {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [118.82, 31.89]
      },
      "properties": {
        "name": "home"
      },
      "updated_at": "2013-07-16T16:36:51Z"
    }
  },
  {
    "serial": "MKUIJI-MKJKUK",
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
    },
    "location": {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [118.82, 31.89]
      },
      "properties": {
        "name": "home"
      },
      "updated_at": "2013-07-16T16:36:51Z"
    }
  }
]

```
