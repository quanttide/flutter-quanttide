/// BLoC事件

/// REST API事件
sealed class RestApiEvent {}

/// 已获取
final class ResourceRetrieved {}

/// 已创建
final class ResourceCreated {}

/// 已更新
final class ResourceUpdated {}

/// 已删除
final class ResourceDeleted {}

/// 已批量获取
final class ResourceListed {}
