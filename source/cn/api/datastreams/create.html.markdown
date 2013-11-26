---
layout: cn_api
current_section: datastreams
title: 数据流创建｜ Dotide API
---

## 创建数据流

    POST /products/:product_id/devices/:device_serial/datastreams

### 输入

| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| name       | string | **必需的**。 数据流标识。类似设备序列号，用来标识设备中的不同数据流。要求：1.英文字符串；2.同一个设备中唯一 |
| annotation | string | 备注名。方便记忆标注的名称。 |
| type       | string | 类型。储存到该数据流的数据点的类型，当类型为"number"或"geopoint"时并且数据点符合对应要求(见[datapoint][datapoint])时，可以在Dotide站点上直接以图表或地图的形式展现数据。 |
| tags       | array  | 标签。一组用来分类，描述的词汇。 |
| properties | hash   | 属性。用来自定义数据流的一些属性。推荐创建`unit_name`和`unit_symbol`两个属性，用于可视化服务，如示例中所示。 |

**示例**

```json
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
```

### 响应

    201 Created

```json
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
```

[datapoint]: /cn/api/datapoints/create.html
