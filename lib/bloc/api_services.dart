import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Define the registration API endpoint
  static const String _registerUrl =
      'http://192.168.18.7:4000/api/v1/hed/register';

  // Updated registerUser method
  static Future<void> registerUser() async {
    var url = Uri.parse(_registerUrl);
    const userData = {
      "name": "kashif",
      "email": "kashif1@gmail.com",
      "contact": "1231321231",
      "password": "12345678"
    };

    // Encode the user data as JSON
    final body = jsonEncode(userData);

    // Define headers
    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      // Make the POST request with headers and body
      final res = await http.post(url, headers: headers, body: body);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        print("Registration successful:");
        print(data);
      } else {
        print("Failed to register. Status code: ${res.statusCode}");
        print("Response body: ${res.body}");
      }
    } catch (e) {
      print("Error during registration: $e");
    }
  }
}
