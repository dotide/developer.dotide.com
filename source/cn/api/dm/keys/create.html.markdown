---
layout: api/dm.cn
current_section: keys
title: Key 创建 ｜ Dotide DB
---

## 创建一个Key

    POST /keys

### 输入

| 名称            | 类型    | 说明 |
| --------------- | ------ | ------------------------------------------------------ |
| label           | string | Key的标识。便于标记Key |
| permissions     | array  | Key权限。设定该Key包含的权限的列表。Key的权限包括"read"和"write"两种。`permissions`默认为空。 |
| global          | boolean| 全局Key。如果`global`为true，则该Key的作用范围为其所有者的所有"资源"，并且忽略`resources`所定义的作用范围。只有全局Key可以创建产品。`global`默认为false。 |
| resources       | array  | Key的作用范围。定义该Key对哪些"资源"起作用**[注1]**。数组的每一个元素为一个"资源"**[注2]**，类型为object，具体构成如下： |

resources中单个元素的构成

| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| product_id     | string | 产品id。 |
| device_serial  | string | 设备序列号。 |
| datastream_name| string | 数据流标识。 |

*注1：*只能指定创建Key操作的用户自己的"资源"。

*注2：*当指定一个"资源"的时候，作用范围会包括该"资源"的"子资源"，例如如果指定一个"设备"，则作用范围会包含该设备以及该设备的所有。

**示例**

```json
{
  "label": "MyPhone",
  "permissions": [
    "read",
    "write"
  ],
  "global": false,
  "resources": [
    {
      "product_id": "951355e5fa56af20sa77c682",
      "device_serial": "516498",
      "datastream_name": "demostream"
    },
    {
      "product_id": "51e51544fa36a48592000074",
      "device_serial": "953786"
    },
    {
      "product_id": "52122490fa36a479150000e7"
    }
  ]
}
```

### 响应

    Status: 201 Created
    Location: http://api.dotide.com/v1/keys/5b1d87bec76c6cb308e95313b29b99148f7eac5a

```json
{
  "kid": "5b1d87bec76c6cb308e95313b29b99148f7eac5a",
  "label": "MyPhone",
  "permissions": [
    "read",
    "write"
  ],
  "global": false,
  "resources": [
    {
      "product_id": "951355e5fa56af20sa77c682",
      "device_serial": "516498",
      "datastream_name": "demostream"
    },
    {
      "product_id": "51e51544fa36a48592000074",
      "device_serial": "953786"
    },
    {
      "product_id": "52122490fa36a479150000e7"
    }
  ]
}
```
