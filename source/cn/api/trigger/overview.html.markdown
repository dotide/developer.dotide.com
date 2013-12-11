---
layout: api/trigger.cn
current_section: overview
title: 概述｜ 触发器
---

## 概述

`触发器(Trigger)`会在有新数据点创建的时候根据触发器的`条件类型（type）`进行判断，若判断符合则执行相应的`动作（action）`。通过触发器，可以实现各种IFTTT（if this then that），比如当温度超过40度时给自己发一封邮件，当距离某点10米的时候给自己推送一条消息等等。

不同的`条件类型(type)`对应着不同的`参数(param)`，见下表：

| 条件类型 | 参数    | 说明 |
| ------- | ------ | --------------------------------- |
| updated | 无     | 有新数据点 |
| lt      | number | 小于 |
| le      | number | 小于或等于 |
| eq      | object/array/string/number/boolean | 相等 |
| ne      | object/array/string/number/boolean | 不等 |
| ge      | number | 大于或等于 |
| gt      | number | 大于 |
| near    | object | 距离某点一定距离以内，要有'latitude', 'longitude'和'max_distance'三个key，'max_distance'单位为米 |

不同的`动作(action)`对应着不同的`配置(config)`，见下表：

`webhook`:

| 名称        | 类型    | 说明 |
| ---------- | ------ | ------------------------- |
| url        | string | **必需的**。目标的URL。       |
| headers    | object | 请求的HEADER参数。           |

POST的body包含相应的产品，设备，数据流，数据点和触发器的信息。例如：

```json
{
  "product": {
    ...
  },
  "device": {
    ...
  },
  "datastream": {
    ...
  },
  "datapoint": {
    ...
  },
  "trigger": {
    ...
  }
}
```

触发器需要指定作用范围

| 名称             | 类型    | 说明 |
| ----------      | ------ | ------------------------- |
| product_id      | string | **必需的**。产品id。       |
| device_serial   | string | 设备序列号，如不指定则作用于该产品的所有设备。 |
| datastream_name | string | **必需的**。数据流标识。           |

触发器可以设置是否为`边缘触发(edge-triggered)`，若设置为边缘触发，则仅当条件从不符合变为符合的时候会触发，否则只要条件符合就会触发。默认为边缘触发。

| 名称          | 类型    | 说明 |
| ----------   | ------  | ------------------------- |
| edge         | boolean | 是否为边缘触发，默认为true       |
