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

数据流操作支持 [Basic Auth][auth] 和 [Access Token][auth] 两种方式。


## 罗列数据流

罗列数据库中的数据流，返回结果按照数据流 id 的字母顺序升序排列。

```
GET /datastreams
```

### 参数
| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| ids        | string | 数据流 id 列表，不同的 id 以`,`分隔。指定此参数后，将只返回 id 在该列表中的数据流。 |
| tags       | string | 数据流包含的标签列表，不同的标签以`,`分隔。每条数据流可包含多个标签，指定此参数后，将返回包含列表中所有标签的数据流。 |
| limit      | number | 数据流的个数的最大值。 |
| offset     | number | 数据流的个数的偏移量，与 `limit` 配合以达到分页的效果。 |
| tz         | string | 指定时区。**默认值**为 `Asia/Shanghai`。 |

**示例**

```
/datastreams?tags=a,b&limit=500
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
    "current_t": "2014-01-03T00:01:02.123+08:00",
    "current_v": 100,
    "created_at": "2014-01-03T00:00:00.001+08:00",
    "updated_at": "2014-01-03T00:01:02.456+08:00"
  }
]
```


## 创建数据流

创建一条数据流。

```
POST /datastreams
```

### 输入

| 名称        | 类型             | 说明 |
| ---------- | ---------------- | ------------------------------------------------------ |
| id         | string           | 指定需要创建的数据流的 id，如不输入，则由系统默认生成。要求：本[数据库][database]中唯一，UTF-8字符串。 |
| name       | string           | 数据流的显示名称。 |
| type       | string           | 指定该数据流存储数据的数据类型。可选值包括：`number`, `string` 和 `geojson`。**默认值**：`number`。 |
| tags       | array(of string) | 标签列表。每个数据流可包含一组标签，每个标签为一个字符串。 |
| properties | object           | 自定义属性。每个数据流可包含一组自定义的属性，每个属性是由`属性名: 属性值`构成的键值对，注意属性名不可包含`$`和`.`。 |
| tz         | string           | 指定时区。**默认值**为 `Asia/Shanghai`。 |

**示例**

```json
{
  "id": "51e51544fa36a48592000074",
  "name": "Demo Datastream",
  "type": "number",
  "tags": ["a", "b", "c"],
  "properties": {
      "prop1": 1
  }
}
```

### 响应

```
Status: 201 OK
Location: http://api.dotide.com/v1/demo/datastreams/51e51544fa36a48592000074
```

```json
{
  "id": "51e51544fa36a48592000074",
  "name": "Demo Datastream",
  "type": "number",
  "tags": ["a", "b", "c"],
  "properties": {
      "prop1": 1
  },
  "current_t": "2014-01-03T00:01:02.123+08:00",
  "current_v": 100,
  "created_at": "2014-01-03T00:00:00.001+08:00",
  "updated_at": "2014-01-03T00:01:02.456+08:00"
}
```


## 读取数据流

读取一条数据流。

```
GET /datastreams/:id
```

### 参数
| 名称        | 类型    | 说明 |
| ---------- | ------ | ---------------------------------- |
| tz         | string | 指定时区。**默认值**为 `Asia/Shanghai`。 |

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
  "tags": ["a", "b", "c"],
  "properties": {
      "prop1": 1
  },
  "current_t": "2014-01-03T00:01:02.123+08:00",
  "current_v": 100,
  "created_at": "2014-01-03T00:00:00.001+08:00",
  "updated_at": "2014-01-03T00:01:02.456+08:00"
}
```


## 更新数据流

更新一条数据流。

```
PUT /datastreams/:id
```

### 输入

| 名称        | 类型             | 说明 |
| ---------- | ---------------- | ------------------------------------------------------ |
| name       | string           | 数据流的显示名称。 |
| tags       | array(of string) | 标签列表。每个数据流可包含一组标签，每个标签为一个字符串。 |
| properties | object           | 自定义属性。每个数据流可包含一组自定义的属性，每个属性是由`属性名: 属性值`构成的“键值对”，注意属性名不可包含`$`和`.`。 |
| tz         | string           | 指定时区。**默认值**为 `Asia/Shanghai`。 |

**示例**

```json
{
  "name": "Demo",
  "tags": ["a", "b", "c", "d"],
  "properties": {
      "prop1": 2
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
  "name": "Demo",
  "type": "number",
  "tags": ["a", "b", "c", "d"],
  "properties": {
      "prop1": 2
  },
  "current_t": "2014-01-03T00:01:02.123+08:00",
  "current_v": 100,
  "created_at": "2014-01-03T00:00:00.001+08:00",
  "updated_at": "2014-01-03T00:02:03.567+08:00"
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
