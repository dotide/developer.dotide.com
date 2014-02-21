---
layout: api/dm.cn
current_section: datapoints
title: 数据点创建｜ Dotide DB
---

## 创建数据点

    POST /datastreams/:id/datapoints

### 输入

| 名称  | 类型           | 说明 |
| ----- | ------ | ------------------------------------------------------ |
| t     | string | **必需的[注1]**。 时间戳。格式遵循ISO 8601标准:YYYY-MM-DDTHH:MM:SSZ。 |
| v     | object/array/string/number/boolean   | **必需的**。 数据点的值。类型不限**[注2]**。例如：数`20.5`，字符`"something"`，数组`[11,45]`，对象`{"name": "dot", "age": 2}`。 |

*注1：*当创建单个数据点的时候，可以没有`t`值。这样意味着以接受到该请求的时刻作为该数据点的`t`值。
*注2：*如果`v`为数值型，或者符合[GeoJSON][geojson]格式并且是Point类型的Feature(如下面示例所示)，则可以在Dotide站点上直接以图表或地图的形式展现数据。

**示例**

`创建单个数据点:`

```json
{
  "t": "2013-06-05T23:50:32Z",
  "v": {
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
    "t": "2013-06-05T23:50:32Z",
    "v": 20
  },
  {
    "t": "2013-06-05T23:50:60Z",
    "v": 27
  }
]
```

### 响应

`创建单个数据点:`

    Status: 201 Created

```json
{
  "t": "2013-06-05T23:50:32Z",
  "v": {
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

    Status: 201 Created
    
```json
[
  {
    "t": "2013-06-05T23:50:32Z",
    "v": 20
  },
  {
    "t": "2013-06-05T23:50:60Z",
    "v": 27
  }
]

```

[geojson]: http://geojson.org/geojson-spec.html
