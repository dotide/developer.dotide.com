---
layout: cn_api
current_section: datapoints
title: 数据点创建｜ Dotide API
---

## Create datapoints

    POST /products/:product/devices/:device_serial/datastreams/:datastream_name/datapoints

~~~json
{
  "datapoints": [{
    "at": "2013-06-05T23:50:32Z",
    "value": "20"
  }]
}
~~~

### Response

    201 OK
