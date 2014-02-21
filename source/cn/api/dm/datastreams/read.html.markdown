---
layout: api/dm.cn
current_section: datastreams
title: 数据流读取｜ Dotide DB
---

## 读取一个数据流

    GET /datastreams/:id

### 响应

    Status: 200 OK

```json
{
  "id": "51e51544fa36a48592000074",
  "name": "Demo Datastream",
  "type": "number",
  "tags": ["demo"],
  "attributes": {
      "attr1": 1
  },
  "current_t": "2014-01-03T00:01:02Z",
  "current_v": 100,
  "created_at": "2014-01-03T00:00:00Z",
  "updated_at": "2014-01-03T00:01:02Z"
}
```
