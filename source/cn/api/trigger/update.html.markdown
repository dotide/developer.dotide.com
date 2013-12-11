---
layout: api/trigger.cn
current_section: update
title: 更新｜ 触发器
---

## 更新一个触发器

    PUT /triggers/:trigger_id

### 输入

| 名称             | 类型    | 说明 |
| ----------      | ------ | ------------------------- |
| product_id      | string | 产品id。       |
| device_serial   | string | 设备序列号，如不指定则作用于该产品的所有设备。 |
| datastream_name | string | 数据流标识。           |
| type            | string | 条件类型。  |
| param           | 视type而定 | 视type而定。 |
| action          | string | 执行的动作。|
| config          | object | 动作的配置。|
| edge            | boolean| 是否边缘触发。默认为true。|


**示例**

```json
{
  "type": "gt",
  "param": 30,
  "action": "webhook",
  "config": {
    "url": "http://example.com",
    "headers": {
      "user-agent": "Dotide"
    }
  },
  "edge": true,
  "product_id": "51355e5fa56af20sa77c682",
  "device_serial": "516498",
  "datastream_name": "demostream"
}
```
### 响应

    Status: 200 OK

```json
{
  "id": "52122490fa36a479150000e7",
  "type": "gt",
  "param": 30,
  "action": "webhook",
  "config": {
    "url": "http://example.com",
    "headers": {
      "user-agent": "Dotide"
    }
  },
  "edge": true,
  "product_id": "51355e5fa56af20sa77c682",
  "device_serial": "516498",
  "datastream_name": "demostream"
}
```
