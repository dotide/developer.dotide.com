---
layout: docs/refs.cn
section: basics
page: overview
title: 调用约定
---

## 调用约定

本节将描述 Dotide API 的组成与使用。

### 概要

Host 为 api.dotide.com，当前 API 版本为 v1。

```
https://api.dotide.com/v1
```

如果因为某些限制无法使用 HTTPS，也可以使用未加密的 URL：

```
http://api.dotide.com/v1
```

因为Dotide API提供的操作都基于某个数据库，所以本文档所述的基础 URL 均为：

```
https://api.dotide.com/v1/:databse_name
```

例如，名为demo的数据库的基础 URL 为 `https://api.dotide.com/v1/demo`。

所有请求和响应的数据均为 JSON 格式。

```
$ curl -i https://api.dotide.com/v1

HTTP/1.1 200 OK
Server: nginx
Date: Thu, 13 Mar 2014 06:03:16 GMT
Content-Type: application/json
Content-Length: 15
Connection: keep-alive
Status: 200 OK
ETag: "8a7b42cd166ab093437c00051a46bd74"
Cache-Control: max-age=0, private, must-revalidate

{"version":"1"}
```

### 参数

很多API有可选参数。对 GET 请求来说，参数应拼接成 `query string` 包含在URL中：

```
$ curl -i https://api.dotide.com/v1/demo/datastreams?limit=10
```

在本例子中，`demo` 是数据库名，`limit` 是可选参数。

对 POST， PUT， DELETE 请求来说，参数不包含在 URL 中，而应该编码成 JSON 格式放在 body 中，注意：

```
$ curl -i -u client_id -d '{"v":4}' -H "Content-Type: application/json"  https://api.dotide.com/v1/demo/datastreams/demostream/datapoints
```

### HTTP 动词

Dotide API 使用不同的动词来区分不同的动作。

| 动词        |  说明 |
| ---------- |  ---------- |
| GET        |  获取资源 |
| POST       |  创建资源 |
| PUT        |  更新资源 |
| DELETE     |  删除资源 |

### 身份验证

Dotide API 支持 Basic 和 Access Token 两种方式进行身份验证。认证失败的请求会返回 `404 Not Found`，而不是 `403 Forbidden`，这是为了防止数据库的信息泄漏给未授权的用户。具体方式见[认证与权限控制][auth]

### 时区

一些请求和响应涉及时间的解析与格式化，用户可以通过两种方式指定时区。一种是在请求的 Header 中设置 `Timezone`：

```
Timezone: Asia/Shanghai
```

```
$ curl -H "Timezone: Asia/Shanghai" https://api.dotide.com/v1/demo/datastreams
```

另一种是在请求的参数中指定 `tz`，例如：

```
$ curl https://api.dotide.com/v1/demo/datastreams?tz=Asia/Shanghai
```

具体的时区值详见 [Olson 数据库][olson]。如果未提供时区信息，则默认为 `Asia/Shanghai`。

[auth]: /cn/docs/refs/basics/auth.html
[olson]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones