# CHANGELOG

## [v0.1.2] - 

优化`APIClient`。

### Features

- `APIClient.requestAPI`增加`data`参数（类似Python`requests`库的`data`入参）和非安全HTTP方法的请求报文。

### Refactored

- APIClient的`parseResponse`重命名为`parseResponseData`，增加`Content-Type`分类处理。
  （PS：此方法暂不列为公开API，因此不影响其他库的使用，不作为不兼容更新列举。）

## [v0.1.1] - 2022-08-10

`pub.dev`初始版本。

### Features

- 增加服务端请求工具`APIClient`。

## [v0.1.1-beta.2] - 2022-08-10

`pub.dev`发布测试。

## [v0.1.0] - 2022-08-05

最小可用版本。无法通过`pub publish`命令检查而无法上传到`pub.dev`。

### Features 

- 增加网络数据加载组件`NetworkFutureBuilder`。
