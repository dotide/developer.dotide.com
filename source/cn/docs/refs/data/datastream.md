---
layout: docs/refs.cn
section: data
page: datastream
title: 数据流
outlines:
  - 权限验证
  - 罗列数据流
  - 创建数据流
  - 读取数据流
  - 更新数据流
  - 删除数据流
---

## 权限验证

数据流操作支持[Basic Auth][auth]和[OAuth][auth]两种形式

## 罗列数据流

```
GET /datastreams
```

### 参数
| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| ids        | string | 数据流id列表，不同的id以','分隔。指定此参数后，将只返回id在该列表中的数据流。 |
| tags       | string | 数据流需要包含的标签的列表，不同的标签以','分隔。每条数据流可包含多个标签，指定此参数后，将只返回包含列表中所有标签的数据流。 |
| limit      | number | 本次请求返回数据流的个数的最大值。 |
| offset     | number | 本次请求返回数据流，需要跳过开头的offset个。 |

**示例**

```
/datastreams?tags=a,b&limit=1000
```

### 响应

```
Status: 200 OK
```

```json
[
  {
    "id": "51e51544fa36a48592000074",
    "name": "Demo Datastream",
    "type": "number",
    "tags": ["a", "b", "c"],
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

## 创建数据流

```
POST /datastreams
```

### 输入
| 名称        | 类型             | 说明 |
| ---------- | ---------------- | ------------------------------------------------------ |
| id         | string           | **可选**。指定需要创建的数据的id，如不输入，则由系统默认生成。要求：本[数据库][database]中唯一，字母，数字和"-"。 |
| name       | string           | **可选**。数据流的显示名称。 |
| type       | string           | **可选**。指定该数据流存储数据的数据类型。可选值包括：'number', 'string', 'geojson'。默认值：'number'。 |
| tags       | array(of string) | 标签列表。每个数据流可包含一组标签，每个标签为一个字符串。 |
| properties | object           | 自定义属性。每个数据流可包含一组自定义的属性，每个属性是由'属性名':'属性值'构成的'键值对' |

**示例**

```json
{
  "id": "51e51544fa36a48592000074",
  "name": "Demo Datastream",
  "type": "number",
  "tags": ["demo"],
  "properties": {
      "prop1": 1
  }
}
```

### 响应

```
Status: 201 OK
```

```json
{
  "id": "51e51544fa36a48592000074",
  "name": "Demo Datastream",
  "type": "number",
  "tags": ["demo"],
  "properties": {
      "prop1": 1
  },
  "current_t": "",
  "current_v": 0,
  "created_at": "2014-01-03T00:00:00Z",
  "updated_at": "2014-01-03T00:00:00ZZ"
}
```

## 读取数据流

```
GET /datastreams/:id
```

### 参数
| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| id         | string | 数据流id。 |

**示例**

```
/datastreams/51e51544fa36a48592000074
```
### 响应

```
Status: 200 OK
```

```json
{
  "id": "51e51544fa36a48592000074",
  "name": "Demo Datastream",
  "type": "number",
  "tags": ["demo"],
  "properties": {
      "prop1": 1
  },
  "current_t": "",
  "current_v": 0,
  "created_at": "2014-01-03T00:00:00Z",
  "updated_at": "2014-01-03T00:00:00ZZ"
}
```

## 更新数据流

```
PUT /datastreams/:id
```

### 输入
| 名称        | 类型             | 说明 |
| ---------- | ---------------- | ------------------------------------------------------ |
| name       | string           | **可选**。数据流的显示名称。 |
| type       | string           | **可选**。指定该数据流存储数据的数据类型。可选值包括：'number', 'string', 'geojson'。默认值：'number'。 |
| tags       | array(of string) | 标签列表。每个数据流可包含一组标签，每个标签为一个字符串。 |
| properties | object           | 自定义属性。每个数据流可包含一组自定义的属性，每个属性是由'属性名':'属性值'构成的'键值对' |

**示例**
```json
{
  "name": "Demo Datastream",
  "type": "number",
  "tags": ["demo"],
  "properties": {
      "prop1": 1
  }
}
```

### 响应

```
Status: 200 OK
```

```json
{
  "id": "51e51544fa36a48592000074",
  "name": "Demo Datastream",
  "type": "number",
  "tags": ["demo"],
  "properties": {
      "prop1": 1
  },
  "current_t": "",
  "current_v": 0,
  "created_at": "2014-01-03T00:00:00Z",
  "updated_at": "2014-01-03T00:00:00ZZ"
}
```

## 删除数据流

```
DELETE /datastreams/:id
```

### 响应

```
Status: 204 No Content
```

[auth]: /cn/docs/refs/basics/auth.html
[database]: /cn/docs/guides/data/database.html
