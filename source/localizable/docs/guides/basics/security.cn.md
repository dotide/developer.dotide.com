---
layout: docs/guides.cn
section: basics
page: security
title: 安全机制
---

目前支持两种方式进行安全验证：

Basic 认证使用数据库唯一的 `client_id` 和 `client_secret` 进行认证，通过认证相当于有了操作该数据库的所有权限，但没有操作其他数据库的权限。

Access Token 认证支持更细致更复杂的权限分配，适用于分发到客户端中进行与 Dotide 的交互。

## Basic 认证

每个数据库都会有一个 `client_id` 和 `client_secret`，用户名对应 `client_id`，口令对应 `client_secret`。

```
$ curl -u client_id https://api.dotide.com/v1/demo/datastreams
```

这种验证适用于服务器间的通讯。不要将 `client_secret` 放置在不安全的环境中，如客户端，浏览器。用到 `client_secret` 的地方务必开启 HTTPS 以保证传输安全。


## Access Token 认证

用户可以创建 `access_token` 进行更细致的权限分配，能精确到不同`数据流`的`读`，`写`，`删除`权限。使用 `access_token` 进行认证有两种方法，一种是将 `access_token` 放到请求的 Header 中：

```
Authorization: Bearer ACCESS_TOKEN
```

另一种是放到请求的参数中：

```
$ curl -u client_id https://api.dotide.com/v1/demo/datastreams?access_token=ACCESS_TOKEN
```

推荐将 `access_token` 放置在 Header 中，并使用 HTTPS 进行传输。目前 `access_token` 还没有过期和刷新的机制， 只可以通过 Access Token 的 API 进行操作。对 Access Token的操作都需要使用 Basic 认证。关于操作 Access Token 的详细内容，参见[认证与权限控制][token]。

[token]: /docs/refs/basics/auth.html
