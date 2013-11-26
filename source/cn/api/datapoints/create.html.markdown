---
layout: cn_api
current_section: datapoints
title: 数据点创建｜ Dotide API
---

## 创建数据点

    POST /products/:product/devices/:device_serial/datastreams/:datastream_name/datapoints

### 输入

| 名称  | 类型           | 说明 |
| ----- | ------ | ------------------------------------------------------ |
| at    | string | **必需的**。 时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| value | json   | **必需的**。 数据点的值。类型不限，编码为json即可。例如：数`20.5`，字符`"something"`，列表`[11,45]`，哈希`{"name": "dot", "age": 2}` |

**示例**

`创建单个数据点:`

```json
{
  "at": "2013-06-05T23:50:32Z",
  "value": [118.82097580000004, 31.891278699999994]
}
```

`创建多个数据点:`

```json
[
  {
    "at": "2013-06-05T23:50:32Z",
    "value": 20
  },
  {
    "at": "2013-06-05T23:50:60Z",
    "value": 27
  }
]
```

### 响应

    201 Created
