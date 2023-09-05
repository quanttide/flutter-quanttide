# TODO

## 模块划分

考虑拆分组件和工具到不同的公开模块中。比如，recase这样的工具函数不适宜和组件混一起。

考虑把quanttide_design和测试工具分离，新建quanttide_testing库，把quanttide_design的测试工具移除。

## APP设置

如果可能，引入开发者模式。
使用场景是，正常情况下不显示各种报错信息以提高APP使用体验，
当开发者需要看用户的详细报错信息时，可以通过打开开发者模式来获取。

## 测试工具

增加一个MaterialWidgetWrapper，套个Scaffold就可以。

## 用例

增加一个完整的APIClient及NetWorkFutureBuilder用例。
目前的主要问题是缺少一个稳定的测试API给项目使用，因此直接在各个项目内实现比较合适。
