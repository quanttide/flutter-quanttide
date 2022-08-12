# quanttide-design-flutter

QuantTide Design Language with Flutter

## 开发者指南

### 数据模型

`lib/models`文件夹下的数据模型遵循
[Freezed库](https://tomicriedel.medium.com/flutter-freezed-the-complete-crashcourse-c942e9aa2428)
的指南维护。

创建或更新以后运行

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```
