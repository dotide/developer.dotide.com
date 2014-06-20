---
layout: docs
category: api
section: mapreduce
toc: article
title: MapReduce
---

## 创建 MapReduce 任务

```
POST /:db/datastreams/:id/mapred
```

#### 输入


> 示例

```json
{
  "range": [1400723585636,1400723585650],
  "map": {
    "function": "core.interval",
    "opts": [10]
  },
  "reduce": {
    "function": "core.aggretion",
    "opts": ["max", "target.key"]
  },
  "async": false,
  "chunked": true,
  "timeout": 1000
}
```

```json
{
  "range": [1400723585636,1400723585650],
  "map": {
    "function": "core.interval",
    "opts": [10]
  },
  "reduce": {
    "language": "javascript",
    "source": "function(v) { return [v]; }"
  },
  "async": true,
  "timeout": 1000
}
```
