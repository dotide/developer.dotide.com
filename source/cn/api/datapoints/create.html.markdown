---
layout: cn_api
current_section: datapoints
title: 数据点创建｜ Dotide API
---

## 创建数据点

    POST /products/:product_id/devices/:device_serial/datastreams/:datastream_name/datapoints

### 输入

| 名称  | 类型           | 说明 |
| ----- | ------ | ------------------------------------------------------ |
| at    | string | **必需的**。 时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| value | object/array/string/number/boolean   | **必需的**。 数据点的值。类型不限[注1]。例如：数`20.5`，字符`"something"`，数组`[11,45]`，对象`{"name": "dot", "age": 2}`。 |

*注1：*如果value为数值型，或者符合[GeoJSON][geojson]格式并且是Point类型的Feature(如下面示例所示)，则可以在Dotide站点上直接以图表或地图的形式展现数据。

**示例**

`创建单个数据点:`

```json
{
  "at": "2013-06-05T23:50:32Z",
  "value": {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [118.82, 31.89]
    },
    "properties": {
      "speed" : 35
    }
  }
}
```

`创建多个数据点:`

```json
[
  {
    "at": "2013-06-05T23:50:32Z",
    "value": 20
  },
  {
    "at": "2013-06-05T23:50:60Z",
    "value": 27
  }
]
```

### 响应

    201 Created

[geojson]: http://geojson.org/geojson-spec.html
