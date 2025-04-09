import 'package:shared_preferences/shared_preferences.dart';

class UserLocalService {
  static Future<void> saveUser(String userId) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('userId', userId);
  }

  static Future<String?> getUserId() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString('userId');
  }
}
