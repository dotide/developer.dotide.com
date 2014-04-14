---
layout: docs/libraries.cn
section: official
page: ruby
title: Ruby SDK for Dotide API
outlines:
  - 概述
  - 安装
  - 建立连接
  - 设置数据库和对应认证信息
  - Access Token操作
  - 数据流操作
  - 数据点操作
---

## 概述

Ruby SDK 代码托管在 [GitHub](https://github.com/dotide/dotide.rb)

[![Build Status](http://travis-ci.org/dotide/dotide.rb.png?branch=master)](https://travis-ci.org/dotide/dotide.rb)
[![Gem Version](https://badge.fury.io/rb/dotide.png)](http://badge.fury.io/rb/dotide)

## 安装

在您 Ruby 应用程序的 `Gemfile` 中添加下行：

    gem 'dotide'

然后，在应用程序所在的目录下，可以运行 `bundle` 安装依赖包：

    $ bundle

或者，可以使用 Ruby 的包管理器 gem 进行安装：

    $ gem install dotide

## 建立连接

### 创建连接实例

```ruby
# 初始化1个连接
opts = {
          :connection_options => {:ssl => {:verify => false}},
          :client_id    => 'a71972f538d75c9b256a'
        }
conn = Dotide::Connection.new(opts)

# 配置1个连接，如果有相同的配置项，会覆盖之前的配置项

# 用 configure 方法
conn.configure do |c|
  c.client_id = 'a71972f538d75c9b256a'
  c.client_secret = 'de370dd3774b5c03597485fba4ca70d0d961f698'
end

# 用赋值方法
conn.client_id = 'a71972f538d75c9b256a'
conn.client_secret = 'de370dd3774b5c03597485fba4ca70d0d961f698'
conn.database = 'dotide-db'
```

### Module Level 连接

**Dotide 模块自带1个全局的连接**，Dotide 模块可以直接执行`Dotide::Connection`的**所有**实例方法：

```ruby
Dotide.client_id = 'a71972f538d75c9b256a'
puts Dotide.client_id
#=> 'a71972f538d75c9b256a'
```

获取该全局连接的方法：

```ruby
conn = Dotide.connection
```

## 设置数据库和对应认证信息

```ruby
# 设置数据库为 dotide-db
conn.use 'dotide-db'
# or
conn.database = 'dotide-db'

# 设置access_token
conn.access_token = 'ef379dd3774b5c03597485fba4ca7110d961f698'

# 设置client_id和client_secret
conn.configure do |c|
  c.client_id = 'a71972f538d75c9b256a'
  c.client_secret = 'de370dd3774b5c03597485fba4ca70d0d961f698'
end
```

**当设置了`client_id`和`client_secret`以后，会优先使用Basic 认证**

## Access Token操作

关于 Access Token 操作的详细参数，请参见 [API 参考手册][api_token]

```ruby
conn.configure do |c|
  c.database = 'dotide-db'
  c.client_id = 'a71972f538d75c9b256a'
  c.client_secret = 'de370dd3774b5c03597485fba4ca70d0d961f698'
end

# 罗列 access tokens
tokens = conn.access_tokens.all

# 创建1个 access token
body = {
  scopes: [{
    permissions: ['read', 'write', 'delete'],
    global: true
  }]
}
token = conn.access_tokens.create(body)
# or
token = conn.access_tokens.build(body)
token.save

# 读取1个 access token
token = conn.access_tokens.find_one('9404fde90f5534164c4da5fd2551807c63352b48dbcb9cfde4f7cfb63da417df')
token.access_token
#=> '9404fde90f5534164c4da5fd2551807c63352b48dbcb9cfde4f7cfb63da417df'
scope = token.scopes[0]
scope.global
#=> true
scope.to_hash
#=> {:permissions => ["read"], :global => true, :ids => [], :tags => []}

# 更新1个 access token
token = conn.access_tokens.find_one('9404fde90f5534164c4da5fd2551807c63352b48dbcb9cfde4f7cfb63da417df')
scope = token.scopes[0]
scope.global = false
scope.tags << 'a'
token.save

# 删除1个 access token
token = conn.access_tokens.find_one('9404fde90f5534164c4da5fd2551807c63352b48dbcb9cfde4f7cfb63da417df')
token.destroy
# or
conn.access_tokens.destroy_one('9404fde90f5534164c4da5fd2551807c63352b48dbcb9cfde4f7cfb63da417df')
```

## 数据流操作

关于数据流操作的详细参数，请参见 [API 参考手册][api_datastream]

```ruby
conn.configure do |c|
  c.database = 'dotide-db'
  c.access_token = 'de370dd3774b5c03597485fba4ca70d0d961f698'
end
datastreams = conn.datastreams

# 罗列数据流(返回标签包含'a', 'b', 'c' 的所有数据流)
dss = datastreams.find(tags: ['a', 'b', 'c'])

# 创建1条数据流
ds = datastreams.create(
  id: 'loc-123456',
  tags: ['location', 'geojson']
)
# or
ds = datastreams.build(
  id: 'loc-123456',
  tags: ['location', 'geojson']
)
ds.save

# 根据 id 读取1条数据流
ds = datastreams.find_one('loc-123456')
ds.type
#=> 'number'

# 更新1条数据流
ds = datastreams.find_one('loc-123456')
ds.tags
#=> ['a', 'b']
ds.tags << 'c'
ds.save

# 删除1条 id 为'loc-123456'的数据流
datastreams.destroy_one('loc-123456')
# or
ds = datastreams.find_one('loc-123456')
ds.destroy
```

## 数据点操作

关于数据流操作的详细参数，请参见 [API 参考手册][api_datapoint]

```ruby
conn.configure do |c|
  c.database = 'dotide-db'
  c.access_token = 'de370dd3774b5c03597485fba4ca70d0d961f698'
end
ds = conn.datastreams.find_one('loc-123456')

# 对数据点进行复合查询
params = {
  interval: 3600,
  summary: 1,
  start: '2014-01-01T00:00:00.000+08:00',
  end: '2014-01-04T00:00:00+08:00'
}
results = ds.datapoints.find(params)
# or
results = conn.datapoints('loc-123456').find(params)
results.id
#=> 'loc-123456'
results.options[:interval]
#=> 3600
dps = results.datapoints
dps.first.t
#=> 2014-01-02T00:00:00.000+08:00

# 一次创建1个数据点
dp = ds.datapoints.create(t: '2014-01-03T00:00:01Z', v: 10)
# or
dp = ds.datapoints.build(t: '2014-01-03T00:00:01Z', v: 10)
dp.save

# 一次创建多个数据点
dps = ds.datapoints.create([
  {t: '2014-01-03T00:00:01Z', v: 10},
  {t: '2014-01-03T00:20:01Z', v: 12}
  ])
dps.length
#=> 2

# 删除一个时间段的数据点
ds.datapoints.destroy_all(
  start: '2014-01-03T00:00:01Z',
  end: '2014-01-03T00:20:01Z'
  )
```

[api_token]: /docs/v1/basics/auth.html
[api_datastream]: /docs/v1/data/datastream.html
[api_datapoint]: /docs/v1/data/datapoint.html
