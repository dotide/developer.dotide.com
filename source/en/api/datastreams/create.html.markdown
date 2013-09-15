---
layout: en_api
current_section: datastreams
title: Create Datastreams｜ Dotide API
---

## Create a single datastream

    POST /products/:product/devices/:device_serial/datastreams

```json
{
  "name": "demostream",
  "type": "number",
  "tags": ["temperature"],
  "units": "Celsius",
  "unit_symbol": "C"
}
```

### Response

    201 Created

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

