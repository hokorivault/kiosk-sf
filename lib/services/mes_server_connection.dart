import 'dart:convert';
import 'package:http/http.dart' as http;

enum HttpMethod { POST, GET, PUT, DELETE, PATCH }

class MESServerConnection {
  Future<http.Response> connectAPI(
    HttpMethod method,
    String url,
    Map<String, dynamic> data,
  ) async {
    Uri uri = Uri.parse(url);
    Map<String, String> header = {'Content-type': 'application/json'};
    http.Response response;
    try {
      switch (method) {
        case HttpMethod.POST:
          //response = await http.post(uri, headers: header, body: jsonEncode(data));
          response = await http.post(uri, headers: header, body: jsonEncode(data));
          break;

        case HttpMethod.GET:
          response = await http.get(uri, headers: header);
          break;

        case HttpMethod.DELETE:
          response = await http.delete(uri,
              headers: header, body: json.encoder.convert(data));
          break;

        case HttpMethod.PUT:
          response = await http.put(uri,
              headers: header, body: json.encoder.convert(data));
          break;

        case HttpMethod.PATCH:
          response = await http.patch(uri,
              headers: header, body: json.encoder.convert(data));
          break;
      }
      //print("response headers: ${response.headers.toString()}");
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }
}
