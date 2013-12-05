---
layout: api/base.cn
current_section: auth
title: 认证 ｜ API基础
---

## 认证

Dotide API现在支持两种认证方式：Basic认证和Token认证

### Basic认证

关于Basic认证的详细介绍请参见[rfc2617][rfc2617]

简单来说，需要在请求中包含以下请求头：

```
Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==
```

其中'QWxhZGRpbjpvcGVuIHNlc2FtZQ=='由"login:password"经过base64加密得到。其中login为用户名或者Email。

几乎所有的http调试工具与http开发库均内置对Basic认证的支持，以curl为例：

```
$curl -u "login" https://api.github.com
```
在出现输入密码的提示后，输入对应的密码即可。

### Token认证

Dotide的每个用户都拥有一个`auth token`，可以在Dotide站点的账户设置页看到。

使用login和token就可以实现Token认证。

具体来说，Token认证有两种方式：

**基于请求头**

在请求中包含以下请求头：

```
Authorization: token login:AUTH-TOKEN
```

**基于请求参数**

在请求中包含以下参数：

```
http://api.dotide.com/v1?login=login&auth_token=AUTH-TOKEN
```

[rfc2617]: http://tools.ietf.org/html/rfc2617
