import 'package:http/http.dart' as http;


/// 503 Service Unavailable
class ServiceUnavailableException extends http.ClientException {
  ServiceUnavailableException(
      String message,
      [Uri? uri]
      ) : super(message, uri);
}
