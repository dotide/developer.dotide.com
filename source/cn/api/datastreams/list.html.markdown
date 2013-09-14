---
layout: cn_api
current_section: datastreams
---

Datastream

## List all datastreams

    GET /products/:product/devices/:serial/datastreams

### Response

    200 OK

~~~json
[
  {
    "name": "demostream",
    "type": "number",
    "unit_name": "Celsius",
    "unit_symbol": "C",
    "current_value": 20,
    "tags": ["temperature"],
    "updated_at": "2013-07-13T15:31:22Z"
  }
]
~~~
