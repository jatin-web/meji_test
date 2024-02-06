import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Network {
  Future get(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log("Status Code: ${response.statusCode}");
        return;
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  Future post(String url, Map<String, dynamic> body) async {
    log("url: $url, body: $body");
    try {
      var response = await http
          .post(Uri.parse(url), body: body)
          .timeout(const Duration(seconds: 15));
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log("Else network");
        throw "Error Occurred";
      }
    } catch (e) {
      log("catch : $e");
      rethrow;
    }
  }
}
