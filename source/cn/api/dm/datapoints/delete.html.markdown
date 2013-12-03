---
layout: api/dm.cn
current_section: datapoints
title: 数据点删除｜ 数据存取
---

## 删除数据点

    DELETE /products/:product_id/devices/:device_serial/datastream/:datastream_name/datapoints

### 参数

| 名称  | 类型 | 说明 |
| ----- | ------ | --- |
| start | string | **必需的**。 起始时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| end   | string | **必需的**。 截止时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| limit | number | 要显示的结果的个数。 |

**示例**

```json
{
  "start": "2013-06-05T23:50:32Z",
  "end": "2013-06-05T23:50:32Z",
  "limit": 20
}
```

### 响应

    Status: 204 No Content
