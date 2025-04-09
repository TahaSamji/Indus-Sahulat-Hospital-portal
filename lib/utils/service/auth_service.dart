import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<String?> login({
    required String phoneNumber,
    required String password,
  }) async {
    const String base_url = "http://localhost:8080/api";

    try {
      final response = await http.post(
        Uri.parse('$base_url/auth/hospital-admin/login'),

        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone":  "+$phoneNumber",
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        if (responseBody["success"] == true) {
          return responseBody["data"]["token"];
        } else {
          return "Login failed";
        }
      } else {
        return "Login failed";
      }
    } catch (e) {
      return "Exception: ${e.toString()}";
    }
  }
}