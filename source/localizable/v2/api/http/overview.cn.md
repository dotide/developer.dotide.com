---
layout: docs
category: api
section: http
toc: section
title: HTTP API
---

Dotide 提供基于 HTTP 1.1 协议的 API。HTTP API 基于 REST 规范设计。本文档为该 API 内容的总目录。

另外，所有示例中，均以[curl][curl]为客户端发送 HTTP 请求。

## 目录

- [HTTP API 基础][api-basic]
  - [调用约定][api-basic]
  - [HTTP 动词][api-basic]
  - [权限验证][api-basic]
  - [时间的表示][api-basic]
- [数据库操作][data-database]
  - [权限验证][data-database]
  - [读取数据库属性][data-database]
  - [更新数据库属性][data-database]
- [Access Token 操作][auth-token]
  - [权限验证][auth-token]
  - [罗列 Access Token][auth-token]
  - [创建一个 Access Token][auth-token]
  - [获取一个 Access Token][auth-token]
  - [更新一个 Access Token][auth-token]
  - [删除一个 Access Token][auth-token]
- [数据流操作][data-datastream]
  - [权限验证][data-datastream]
  - [查询数据流][data-datastream]
  - [创建一条数据流][data-datastream]
  - [获取一条数据流][data-datastream]
  - [更新一条数据流][data-datastream]
  - [删除一条数据流][data-datastream]
- [单条数据流的数据点操作][data-datapoint]
  - [权限验证][data-datapoint]
  - [获取数据点][data-datapoint]
  - [创建数据点][data-datapoint]
  - [删除数据点][data-datapoint]
- [MapReduce][dp-mr]

[curl]:http://curl.haxx.se/docs/manpage.html
[api-basic]:/v2/api/http/basic.html
[auth-token]:/v2/api/http/token.html
[data-database]:/v2/api/http/database.html
[data-datastream]:/v2/api/http/datastream.html
[data-datapoint]:/v2/api/http/datapoint.html
[dp-mr]:/v2/api/http/mapreduce.html
