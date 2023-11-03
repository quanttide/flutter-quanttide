/// BLoC状态

/// 网络状态
sealed class NetworkState {}

/// 初始
final class NetworkInitial {}

/// 等待中
final class NetworkWaiting {}

/// 成功
final class NetworkSucceeded {}

/// 失败
final class NetworkError {}
