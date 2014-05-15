---
layout: docs
category: api
section: http
toc: section
title: HTTP API
---

Riak has a rich, full-featured HTTP 1.1 API. This is an overview of the operations you can perform via HTTP and can be used as a guide for developing a compliant client. All URLs assume the default configuration values where applicable. All examples use curl to interact with Riak.

## 目录

- [HTTP API 基础][api-basic]
  - [调用约定][api-basic]
  - [请求参数][api-basic]
  - [HTTP 动词][api-basic]
  - [权限验证][api-basic]
  - [时区][api-basic]
- [Access Token 操作][auth-token]
  - [权限验证][auth-token]
  - [罗列 Access Token][auth-token]
  - [创建 Access Token][auth-token]
  - [读取 Access Token][auth-token]
  - [更新 Access Token][auth-token]
  - [删除 Access Token][auth-token]
- [数据流操作][data-datastream]
  - [权限验证][data-datastream]
  - [罗列数据流][data-datastream]
  - [创建数据流][data-datastream]
  - [读取数据流][data-datastream]
  - [更新数据流][data-datastream]
  - [删除数据流][data-datastream]
- [数据点操作][data-datapoint]
  - [权限验证][data-datapoint]
  - [读取数据点][data-datapoint]
  - [创建数据点][data-datapoint]
  - [删除数据点][data-datapoint]
- [MapReduce][dp-mr]

[api-basic]:/v2/api/http/basic.html
[auth-token]:/v2/api/http/token.html
[data-datastream]:/v2/api/http/datastream.html
[data-datapoint]:/v2/api/http/datapoint.html
[dp-mr]:/v2/api/http/mapreduce.html
