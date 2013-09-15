---
layout: cn_api
current_section: datapoints
title: 数据点读取｜ Dotide API
---

## 读取一个数据点

    GET /devices/:device_serial/datastreams/:datastream_name/datapoints/:timestamp

### 响应

    200 OK

```json
{
    "at": "2013-06-05T23:41:33Z",
    "value": "22"
}
```
