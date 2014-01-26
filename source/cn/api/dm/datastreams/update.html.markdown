---
layout: api/dm.cn
current_section: datastreams
title: 数据流更新｜ Dotide DB
---

## 更新一个数据流

    PUT /datastreams/:datastream_name

### 输入

| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| id         | string | **可选**。 如不输入，则由系统默认生成。要求：字母，数字和"-"。 |
| name       | string | **必需**。 数据流标识。要求：1.英文字符串；2.同一个设备中唯一。 |
| type       | string | 类型。储存到该数据流的数据点的类型，当类型为"number"或"geopoint"时并且数据点符合对应要求(见[datapoint][datapoint])时，可以在Dotide站点上直接以图表或地图的形式展现数据。 |
| tags       | string（array）  | 标签。一组用来分类，描述的词汇。请用逗号分隔，如“temperature，demo”。 |
| attributes | string   | 属性。用来自定义数据流的一些属性。 |
| public     | boolean | 权限标志，标志该条数据流为公有还是私有（“0”为私有，“1”为公有）。 |

**示例**

```json
[
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
]
```

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
