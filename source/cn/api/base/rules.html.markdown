---
layout: api/base.cn
current_section: rules
title: 调用约定 ｜ API基础
---

## 调用约定

### 请求

**API文档描述的所有API请求均基于`HTTP协议`**

**API的调用前缀统一为`http://api.dotide.com/v1`**

API文档各部分对API的描述，如

```
GET /keys/:key_kid
```

表示：通过`GET`方式请求`http://api.dotide.com/v1/keys/:key_kid`。

链接中以':'开头的部分表示是`变量`，需要用具体的值替换。

**无论所有数据均以`json`传输**

所有请求均应包含如下请求头：

```
Accept: application/json
```

所有请求的body均应为json，所有响应的body均为json。

### 编码

API的输入输出编码全部为UTF-8。

时间均以ISO 8601格式表示：

```
YYYY-MM-DDTHH:MM:SSZ
```

### 分页

当请求会返回列表形式的响应时，为避免返回的列表元素过多，Dotide需要对返回结果进行`分页`。这样需要在请求的参数中加上分页相关的参数。

| 名称  | 类型  | 说明 |
| ------- | ------ | ------------------------------------------------------ |
| page    | number | 第几页。从1开始的整数，默认为1。 |
| per_page| number | 每页最多包含多少元素。最大为1000，默认为100。 |

示例如下：

```
http://api.dotide.com/v1/keys/:key_kid?page=2&per_page=10
```

<!-- ### CORS -->
