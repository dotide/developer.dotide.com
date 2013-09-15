---
layout: en_api
current_section: datastreams
title: Update Datastreams｜ Dotide API
---

## Update a datastream

    PUT /products/:product/devices/:device_serial/datastreams/:datastream_name

```json
{
  "name": "New Name"
}
```

### Response

    200 OK

```json
{
  "name": "New Name",
  "type": "number",
  "unit_name": "Celsius",
  "unit_symbol": "C",
  "current_value": 20,
  "tags": ["temperature"],
  "updated_at": "2013-07-13T15:31:23Z"
}
```
