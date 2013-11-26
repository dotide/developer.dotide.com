---
layout: cn_api
current_section: devices
title: 设备更新 ｜ Dotide API
---

## 更新一个设备

    PUT /products/:product/devices/:device_serial

### 输入

| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| serial     | string | 设备序列号。用来标识一个产品下不同的设备。要求：同一个产品下唯一。 |
| title      | string | 设备名。 |
| description| string | 设备描述。 |
| private    | boolean| 是否私有。如果是false，则会：1.任何ApiKey都拥有该设备的读(read)权限，2.任何人都可以访问该设备的dotide页面。 |
| tags       | array  | 标签。一组用来分类，描述的词汇。 |
| properties | object   | 属性。用来自定义设备的一些属性。 |
| location   | object   | 设备位置。遵循[GeoJSON][geojson]格式。并且此处只支持Point类型的Feature，参见示例中的"location"部分 |

**示例**

```json
{
  "serial": "AFKDJK-UIJSJK",
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
  }
}
```

### 响应

    200 OK

```json
{
  "serial": "AFKDJK-UIJSJK",
  "title": "王迪的iPhone 10",
  "description": "王迪自制的iPhone",
  "private": true,
  "status": "live",
  "created_at": "2013-07-16T16:36:51Z",
  "updated_at": "2013-07-16T16:36:51Z",
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
    },
    "updated_at": "2013-07-16T16:36:51Z"
  }
}
```

[geojson]: http://geojson.org/geojson-spec.html
