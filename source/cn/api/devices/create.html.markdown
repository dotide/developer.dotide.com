---
layout: cn_api
current_section: devices
title: 设备创建 ｜ Dotide API
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

    201 Created
