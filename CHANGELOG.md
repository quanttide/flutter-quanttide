# CHANGELOG

## [v0.2.0] - 

(break change) 增加用户鉴权组件。

### Features 

`APIClient`:
- 增加账号密码注册API`signup`。
- 增加账号密码登录API`login`。

测试工具：
- 增加`pumpWidget`函数。

### Refactored 

`APIClient`:
- (break change)构造器的入参`mockClientHandler`重命名为`mockHandler`。
- (break change)`requestAPI`方法的`apiRoot`重命名为`apiHost`。

## [v0.1.2] - 2022-08-11

优化`APIClient`。

### Features

- `APIClient.requestAPI`增加`data`参数（类似Python`requests`库的`data`入参）和非安全HTTP方法的请求报文，
  增加通用异常抛出和503异常抛出。
- 增加测试工具模块`testing`，增加组件测试工具`pumpAsyncWidget`和`WidgetTestWrapper`。

### Refactored

- APIClient的`parseResponse`重命名为`parseResponseData`，增加`Content-Type`分类处理。
  （PS：此方法暂不列为公开API，因此不影响其他库的使用，不作为不兼容更新列举。）
  
## [v0.1.1] - 2022-08-10

`pub.dev`初始版本。

### Features

- 增加服务端请求工具`APIClient`。

## [v0.1.0] - 2022-08-05

最小可用版本。无法通过`pub publish`命令检查而无法上传到`pub.dev`。

### Features 

- 增加网络数据加载组件`NetworkFutureBuilder`。
