---
layout: docs
category: api
section: token
toc: article
title: Access Token 操作
---

## 罗列 Access Token

```
GET /:db/access_tokens
```

#### 参数
| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------------------------------------ |
| limit      | number | 返回 access token 的个数的最大值。**默认值**为`1000`，**最大值**为`10000`。 |
| offset     | number | 返回 access token 的偏移量，即返回结果中跳过开头的 `offset`个 access token，与 `limit` 配合以达到分页的效果。**默认值**为`0` |

#### 响应

```
Status: 200 OK
```

```json
[
  {
    "access_token": "61e13e47ed0b1b6f6a0ebe598d5ddba0c386a0d856487ec84e973d06b1848221",
    "scopes": [{
      "permissions": [
        "read",
        "write",
        "delete"
      ],
      "global": true,
      "ids": [],
      "tags": []
    }],
    "created_at": "2014-03-01T16:59:48.455+08:00",
    "updated_at": "2014-03-01T17:01:06.690+08:00"
  }
]
```


## 创建一个 Access Token

```
POST /:db/access_tokens
```

#### 输入

| 名称        | 类型             | 说明 |
| ---------- | ---------------- | ------------ |
| scopes     | array            | 一组授权规则。|

`scopes` 列表中，每个元素是一个表示授权规则的 hash，其构成如下表所示：

| 名称        | 类型    | 说明 |
| ----------  | ------- | ------------ |
| permissions | array | 指定权限，**可选** `read`，`write` 和 `delete`。 |
| global      | boolean | 是否全局。 **默认值**为 `false`。 |
| ids         | array | 数据流 'id' 的列表。 |
| tags        | array | 数据流标签的列表。|

`permission` 规定了规则的权限，`global`, `ids`, `tags` 共同规定了规则的适用范围。

`global` 为 `true` 时，表示该规则适用于当前数据库中的所有数据流，并忽略 `ids` 和 `tags` 的值。`global`为 `false` 时，该规则的适用范围由 `ids` 和 `tags` 决定。

`ids` 表示： id 在该列表中的数据流将适用该规则。

`tags` 表示： 标签包含 `tags` 中所有标签的数据流将适用该规则。

`ids` 和 `tags` 二者结果的“并集”为最终适用该规则的数据流。


> 示例

```json
{
  "scopes": [{
    "permissions": ["read", "write", "delete"],
    "global": false,
    "ids": ["51e51544fa36a48592000074"],
    "tags": ["a", "b"]
  }]
}
```

#### 响应

```
Status: 201 Created
Location: https://api.dotide.com/v1/demo/access_tokens/61e13e47ed0b1b6f6a0ebe598d5ddba0c386a0d856487ec84e973d06b1848223
```

```json
{
  "access_token": "61e13e47ed0b1b6f6a0ebe598d5ddba0c386a0d856487ec84e973d06b1848223",
  "scopes": [{
    "permissions": [
      "read",
      "write",
      "delete"
    ],
    "global": false,
    "ids": ["51e51544fa36a48592000074"],
    "tags": ["a", "b"]
  }],
  "created_at": "2014-03-01T16:59:48.455+08:00",
  "updated_at": "2014-03-01T17:01:06.690+08:00"
}
```


## 获取一个 Access Token

```
GET /:db/access_tokens/:access_token
```

#### 响应

```
Status: 200 OK
```

```json
{
  "access_token": "61e13e47ed0b1b6f6a0ebe598d5ddba0c386a0d856487ec84e973d06b1848223",
  "scopes": [{
    "permissions": [
      "read",
      "write",
      "delete"
    ],
    "global": false,
    "ids": ["51e51544fa36a48592000074"],
    "tags": ["a", "b"]
  }],
  "created_at": "2014-03-01T16:59:48.455+08:00",
  "updated_at": "2014-03-01T17:01:06.690+08:00"
}
```


## 更新一个 Access Token

```
PUT /:db/access_tokens/:access_token
```

#### 输入

| 名称        | 类型             | 说明 |
| ---------- | ---------------- | ------------ |
| scopes     | array            | 一组授权规则。|

`scopes` 列表中，每个元素是一个表示授权规则的 hash，其构成与创建 Access Token 中描述相同。

> 示例

```json
{
  "scopes": [{
    "permissions": ["read", "write", "delete"],
    "global": false,
    "ids": ["51e51544fa36a48592000074"],
    "tags": ["a", "b", "c"]
  }]
}
```

#### 响应

```
Status: 200 OK
```

```json
{
  "access_token": "61e13e47ed0b1b6f6a0ebe598d5ddba0c386a0d856487ec84e973d06b1848223",
  "scopes": [{
    "permissions": [
      "read",
      "write",
      "delete"
    ],
    "global": false,
    "ids": ["51e51544fa36a48592000074"],
    "tags": ["a", "b", "c"]
  }],
  "created_at": "2014-03-01T16:59:48.455+08:00",
  "updated_at": "2014-03-02T17:01:06.690+08:00"
}
```


## 删除一个 Access Token

```
DELETE /:db/access_tokens/:access_token
```

#### 响应

```
Status: 204 No Content
```

[auth]:/v2/auth/overview.html
