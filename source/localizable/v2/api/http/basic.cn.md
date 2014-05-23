---
layout: docs
category: api
section: http
toc: article
title: HTTP API 基础
---

## 调用约定

### URI 前缀

API 服务域名地址为：`api.dotide.com`，当前 API 版本为 v2。

协议推荐使用 HTTPS，如果因为某些限制无法使用 HTTPS，也可以使用未加密的 HTTP：

所以，API 服务入口地址(使用 HTTPS)为：

```
https://api.dotide.com/v2
```

在 HTTP API 相关文档中，**如果没有特殊说明，所述 URI 均要加上上述前缀**。

例如 `/:db` 指代 `https://api.dotide.com/v2/:db`

### 请求的表示

以

```
GET /:db
```

为例：

`GET` 表示 HTTP 动词, 本例中 HTTP 请求的动词需要使用 `GET`。

`:db` 表示 URI 中需要替换成特定值的变量部分。本例中，如果我们操作的是名为 'demo' 的数据库，则最终实际的 URI 应该为 `https://api.dotide.com/v2/demo`。

### 请求的格式

对 GET 和 DELETE 请求来说，一般会有可选参数。参数应拼接成 `query string` 包含在 URI 中：

```
$ curl -i https://api.dotide.com/v1/demo/datastreams?limit=10
```

在本例子中，`demo` 是数据库名，`limit` 是可选参数。

对 POST 和 PUT 请求来说，一般会有输入。输入不包含在 URL 中，而应该编码成`json`格式放在请求的`body` 中，如：

```
$ curl -i -u client_id -d '{"v":4}' -H "Content-Type: application/json"  https://api.dotide.com/v1/demo/datastreams/demostream/datapoints
```

### 响应的格式

所有响应均包含下述的 `Header`， 且`body`格式均为 `json`。

```
$ curl -i https://api.dotide.com/v2

HTTP/1.1 200 OK
Server: nginx
Date: Thu, 13 Mar 2014 06:03:16 GMT
Content-Type: application/json
Content-Length: 15
Connection: keep-alive
Status: 200 OK
ETag: "8a7b42cd166ab093437c00051a46bd74"
Cache-Control: max-age=0, private, must-revalidate

{"version":"2"}
```

## HTTP 动词

Dotide 的 HTTP API 遵循 REST 设计模式。使用不同的动词来区分不同的动作。

| 动词        |  说明 |
| ---------- |  ---------- |
| GET        |  获取资源 |
| POST       |  创建资源或任务(例如 MapReduce) |
| PUT        |  更新资源。例如某资源有"location", "size"两个属性。需要发送包含 "location", "size" 属性新值的 PUT 请求，更新该资源。 |
| DELETE     |  删除资源 |


## 权限验证

**HTTP API 的调用均需要通过权限验证**。即：调用 API 时，在请求中附带认证信息，认证通过并且其授权内容与该 API 相符合。

Dotide 支持两种认证：'Basic' 和 'Access Token' 认证。在请求中附带这两种认证信息的方式如下：

**Basic 认证**

需要在 HTTP 请求头部以 [HTTP Basic Authentication][http-basic-auth] 方式附上 `client_id` 和 `client_secret`(每个数据库都会有一个 `client_id` 和 `client_secret`，以`client_id`作为用户名，`client_secret`作为口令):

```
$ curl -u CLIENT_ID:CLIENT_SECRET https://api.dotide.com/v2/demo
```

CLIENT\_ID，CLIENT\_SECRET 分别为 `client_id`和`client_secret`的值。

**Access Token 认证**

方法一，将 `access_token` 附在 HTTP 请求头部：

```
$ curl -H "Authorization: Bearer ACCESS_TOKEN" https://api.dotide.com/v2/demo/datastreams
```

方法二，将 `access_token` 附在 URI 参数部分：

```
$ curl https://api.dotide.com/v2/demo/datastreams?access_token=ACCESS_TOKEN
```

ACCESS\_TOKEN 为 `access_token`的值。

权限验证失败(可能是认证失败，也可能是授权不合)的请求会返回 `404 Not Found`，而不是 `403 Forbidden`，这是为了防止数据库的信息泄漏给未授权的用户。

关于权限验证的详细内容可参见[权限控制][auth-doc]部分。


## 时间的表示

Dotide API 支持两种时间表示方式：以毫秒为单位的 [Unix time][unix_time] 和 [ISO_8601][iso8601]格式的字符串，分别以 `unix` 和 `iso` 表示。

### 请求中的时间表示的设定

用户无需在请求中指定输入参数中时间以何种方式表示。Dotide API 服务器会进行自动判断。

### 响应中的时间表示的设定

可以通过两种方法指定时间表示方式。一种是在 HTTP 请求头部附上 `Timestamp`：

```
$ curl -H "Timestamp: unix" https://api.dotide.com/v1/demo/datastreams
```

另一种是在 URI 参数部分指定 `ts`，例如：

```
$ curl https://api.dotide.com/v1/demo/datastreams?ts=iso
```

此外，对于 `iso`，还可以通过两种方法指定时区。一种是在 HTTP 请求头部附上 `Timezone`：

```
$ curl -H "Timestamp: iso" -H "Timezone: Asia/Shanghai" https://api.dotide.com/v1/demo/datastreams
```

另一种是在 URI 参数部分指定 `tz`，例如：

```
$ curl https://api.dotide.com/v1/demo/datastreams?ts=iso&tz=Asia/Shanghai
```

具体的时区值详见 [Olson 数据库][olson]。

当没有提供时间表示方式和时区信息时，二者由数据库的 `ts`, `tz` 属性决定。见[更新数据库属性][database-op]

[auth-doc]:/v2/auth/overview.html
[http-basic-auth]:http://tools.ietf.org/html/rfc1945#section-11.1
[olson]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
[unix_time]: http://en.wikipedia.org/wiki/Unix_time
[iso8601]: http://en.wikipedia.org/wiki/ISO_8601
[database-op]: /v2/api/http/database.html#3-更新数据库属性
