---
layout: en_api
current_section: datastreams
title: Read Datastreams｜ Dotide API
---

## Read a datastream

    GET /products/:product/devices/:device_serial/datastreams/:datastream_name

### Response

    200 OK

```json
{
  "name": "demostream",
  "type": "number",
  "unit_name": "Celsius",
  "unit_symbol": "C",
  "current_value": 20,
  "tags": ["temperature"],
  "updated_at": "2013-07-13T15:31:22Z"
}
```
