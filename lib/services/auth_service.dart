import 'package:http/http.dart' as http;
import 'package:todo_with_node/config/api.dart';

class AuthService {
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('$mainUrl/signUp');

      final response = await http.post(
        url,
        body: {'name': name, 'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return 'Sign up successful';
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      rethrow;
    }
  }
}
 