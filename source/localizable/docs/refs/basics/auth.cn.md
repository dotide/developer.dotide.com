---
layout: docs/refs.cn
section: basics
page: auth
title: 认证与权限控制
outlines:
  - 概述
  - 罗列 Access Token
  - 创建 Access Token
  - 读取 Access Token
  - 更新 Access Token
  - 删除 Access Token
---

## 概述

Basic 认证适用与服务端间的安全通信， Access Token 适用于分发给客户端进行与 Dotide 交互。对 Access Token 的操作要通过 Basic 认证。

关于 Basic 认证和 Access Token 认证的说明，请参考：[安全机制][security]

## 罗列 Access Token

罗列数据库的 Access Token。

```
GET /access_tokens
```

### 响应

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


## 创建 Access Token

创建一个 Access Token。

```
POST /access_tokens
```

### 输入

| 名称        | 类型             | 说明 |
| ---------- | ---------------- | ------------ |
| scopes     | array            | 指定作用范围， 每个元素描述如下。 |

scope

| 名称        | 类型             | 说明 |
| ----------  | ---------------- | ------------ |
| permissions | array(of string) | 指定权限，可选 `read`，`write` 和 `delete`。 |
| global      | boolean          | 是否全局，可选 `true` 或 `false`，若指定为 `true` 则忽略 `ids` 和 `tags`， **默认值**为 `false`。 |
| ids         | array(of string) | 指定数据流的 id，表示作用的数据流 id 范围。 |
| tags        | array(of string) | 制定数据流的 tag， 表示作用于包含所有 tag 的数据流。|

**示例**

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

### 响应

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


## 读取 Access Token

读取一个 Access Token。

```
GET /access_tokens/:access_token
```

**示例**

```
/access_tokens/61e13e47ed0b1b6f6a0ebe598d5ddba0c386a0d856487ec84e973d06b1848223
```

### 响应

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


## 更新 Access Token

更新一个 Access Token。

```
PUT /access_tokens/:access_token
```

### 输入

| 名称        | 类型             | 说明 |
| ---------- | ---------------- | ------------ |
| scopes     | array            | 指定作用范围， 每个元素描述如下。 |

scope

| 名称        | 类型             | 说明 |
| ----------  | ---------------- | ------------ |
| permissions | array(of string) | 指定权限，可选 `read`，`write` 和 `delete`。 |
| global      | boolean          | 是否全局，可选 `true` 或 `false`，若指定为 `true` 则忽略 `ids` 和 `tags`， **默认值**为 `false`。 |
| ids         | array(of string) | 指定数据流的 id，表示作用的数据流 id 范围。 |
| tags        | array(of string) | 制定数据流的 tag， 表示作用于包含所有 tag 的数据流。|

**示例**

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

### 响应

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


## 删除 Access Token

删除一个 Access Token。

```
DELETE /access_tokens/:access_token
```

### 响应

```
Status: 204 No Content
```

[security]:/docs/guides/basics/security.html
