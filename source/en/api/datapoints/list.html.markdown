---
layout: en_api
current_section: datapoints
title: List Datapoints｜ Dotide API
---

## Create datapoints

    POST /products/:product/devices/:device_serial/datastreams/:datastream_name/datapoints

```json
{
  "datapoints": [{
    "at": "2013-06-05T23:50:32Z",
    "value": "20"
  }]
}
```
### Response

    201 OK
