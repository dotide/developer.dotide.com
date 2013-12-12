---
layout: api/trigger.cn
current_section: create
title: 创建 ｜ 触发器
---

## 创建一个触发器

    POST /triggers

### 输入

| 名称             | 类型    | 说明 |
| ----------      | ------ | ------------------------- |
| product_id      | string | **必需的**。产品id。       |
| device_serial   | string | 设备序列号，如不指定则作用于该产品的所有设备。 |
| datastream_name | string | **必需的**。数据流标识。           |
| type            | string | **必需的**。条件类型。  |
| param           | 视type而定 | **必需的**。视type而定。 |
| action          | string | **必需的**。执行的动作。|
| config          | object | **必需的**。动作的配置。|
| edge            | boolean| 是否边缘触发。默认为true。|
| active          | boolean| 是否启用触发器。默认为true。|

**示例**

```json
{
  "type": "gt",
  "param": 40,
  "action": "webhook",
  "config": {
    "url": "http://example.com",
    "headers": {
      "user-agent": "Dotide"
    }
  },
  "edge": true,
  "active": true,
  "product_id": "51355e5fa56af20sa77c682",
  "device_serial": "516498",
  "datastream_name": "demostream"
}
```

### 响应

    Status: 201 Created
    Location: http://api.dotide.com/v1/triggers/52122490fa36a479150000e7

```json
{
  "id": "52122490fa36a479150000e7",
  "type": "gt",
  "param": 40,
  "action": "webhook",
  "config": {
    "url": "http://example.com",
    "headers": {
      "user-agent": "Dotide"
    }
  },
  "edge": true,
  "active": true,
  "triggered": false,
  "product_id": "51355e5fa56af20sa77c682",
  "device_serial": "516498",
  "datastream_name": "demostream"
}
```
