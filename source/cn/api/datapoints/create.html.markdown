---
layout: cn_api
current_section: datapoints
title: 数据点创建｜ Dotide API
---

## 创建数据点(批量)

    POST /products/:product/devices/:device_serial/datastreams/:datastream_name/datapoints

```json
{
  "datapoints": [{
    "at": "2013-06-05T23:50:32Z",
    "value": "20"
  }]
}
```

### 响应

    201 Created
