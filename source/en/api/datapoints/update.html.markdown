---
layout: en_api
current_section: datapoints
title: Update Datapoints｜ Dotide API
---

## Update a single datapoint

    PUT /devices/:device_serial/datastream/:datastream_name/datapoints/:timestamp

```json
    {
    "at": "2013-06-05T23:41:33Z",
    "value": 23
    }
```

### Response

    200 OK

```json
    {
    "at": "2013-06-05T23:41:33Z",
    "value": 23
    }
```
