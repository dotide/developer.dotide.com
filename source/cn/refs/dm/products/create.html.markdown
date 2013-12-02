---
layout: refs/dm.cn
current_section: products
title: 产品创建 ｜ 数据存取
---

## 创建一个产品

    POST /products

### 输入

| 名称            | 类型    | 说明 |
| --------------- | ------ | ------------------------------------------------------ |
| name            | string | 产品名。 |
| description     | string | 产品描述。 |
| device_template | object   | 设备模板。当创建该产品的设备时，遵循此模板创建设备，包括设备的基本信息以及设备的数据流构成。模板以object表示，object的具体构成如下： |

device_template构成

| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| title      | string | 设备名。 |
| description| string | 设备描述。 |
| private    | boolean| 是否私有。如果是false，则会：1.任何人都可以访问该设备的dotide页面, 2.任何ApiKey都拥有该设备的读(read)权限。 |
| tags       | array  | 标签。一组用来分类，描述的词汇。 |
| properties | object   | 属性。用来自定义设备的一些属性。 |
| location   | object   | 设备位置。遵循[GeoJSON][geojson]格式。并且此处只支持Point类型的Feature，参见示例中的"location"部分 |
| datastreams| array  | 数据流。设备包含的数据流，每个数据流为数组的一个元素，类型为object，object的具体构成如下： |

datastreams中单个元素的构成

| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| name       | string | **条件必需的[注1]**。 数据流标识。类似设备序列号，用来标识设备中的不同数据流。要求：1.英文字符串；2.同一个设备中唯一 |
| annotation | string | 备注名。方便记忆标注的名称。 |
| type       | string | 类型。储存到该数据流的数据点的类型，当类型为"number"或"geopoint"时并且数据点符合对应要求(见[datapoint][datapoint])时，可以在Dotide站点上直接以图表或地图的形式展现数据。 |
| tags       | array  | 标签。一组用来分类，描述的词汇。 |
| properties | object   | 属性。用来自定义数据流的一些属性。推荐创建`unit_name`和`unit_symbol`两个属性，用于可视化服务，如示例中所示。 |

*注1：*条件必需是指：如果datastreams包含元素，则每个元素的`name`不能为空。

**示例**

```json
{
  "name": "Temperature Monitor",
  "description": "A temperature monitor.",
  "device_template": {
    "title": "王迪的iPhone 10",
    "description": "王迪自制的iPhone",
    "private": true,
    "tags": [
      "demo",
      "temperature"
    ],
    "properties": {
      "prop1": "abc"
    },
    "location": {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [118.82, 31.89]
      },
      "properties": {
        "name" : "home"
      }
    },
    "datastreams": [
      {
        "name": "icetemp",
        "annotation": "冰箱温度值",
        "type": "number",
        "tags": ["temperature"],
        "properties": {
          "unit_name": "摄氏度",
          "unit_symbol": "C"
        }
      }
    ]
  }
}
```

### 响应

    Status: 201 Created
    Location: http://api.dotide.com/v1/products/51e51544fa36a48592000074

```json
{
  "id": "51e51544fa36a48592000074",
  "name": "Temperature Monitor",
  "description": "A demo device for temperature monitor.",
  "state": "deploy",
  "devices_count": 0,
  "activated_devices_count": 0,
  "device_template": {
    "title": "王迪的iPhone 10",
    "description": "王迪自制的iPhone",
    "private": true,
    "tags": [
      "demo",
      "temperature"
    ],
    "properties": {
      "prop1": "abc"
    },
    "location": {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [118.82, 31.89]
      },
      "properties": {
        "name" : "home"
      }
    },
    "datastreams": [
      {
        "name": "icetemp",
        "annotation": "冰箱温度值",
        "type": "number",
        "tags": ["temperature"],
        "properties": {
          "unit_name": "摄氏度",
          "unit_symbol": "C"
        }
      }
    ]
  }
}
```

[geojson]: http://geojson.org/geojson-spec.html
[datapoint]: /cn/api/datapoints/create.html
