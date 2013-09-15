---
layout: cn_api
current_section: datapoints
title: 数据点读取｜ Dotide API
---

## Read a datapoint

    GET /devices/:device_serial/datastreams/:datastream_name/datapoints/:timestamp

### Response

    200 OK

```json
{
    "at": "2013-06-05T23:41:33Z",
    "value": "22"
}
```
