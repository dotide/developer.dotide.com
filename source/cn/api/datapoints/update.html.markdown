---
layout: cn_api
current_section: datapoints
title: 数据点更新｜ Dotide API
---

## 更新一个数据点

    PUT /devices/:device_serial/datastream/:datastream_name/datapoints/:timestamp

```json
    {
    "at": "2013-06-05T23:41:33",
    "value": "23"
    }
```

### 响应

    200 OK

```json
    {
    "at": "2013-06-05T23:41:33",
    "value": "23"
    }
```
