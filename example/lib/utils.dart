import 'package:http/http.dart' as http;


Future<dynamic> errorRequest() async {
  http.Response response = await http.get(Uri.https('example.com', 'error'));
  return response;
}