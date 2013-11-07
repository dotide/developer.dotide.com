---
layout: cn_api
current_section: datapoints
title: 数据点罗列｜ Dotide API
---

## 列出所有数据点

    GET /devices/:device/datastreams/:datastream/datapoints

```json
{
  "datapoints": [{
    "at": "2013-06-05T23:50:32Z",
    "value": 20
  }]
}
```
### 响应

    200 OK
