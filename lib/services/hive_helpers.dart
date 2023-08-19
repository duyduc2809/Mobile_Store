import 'package:hive_flutter/adapters.dart';
import 'package:mobile_store/models/api_user.dart';

import '../models/user.dart';

class HiveHelper {
  static var box;

  static Future<void> openBox() async {
    box = await Hive.openBox('userData');
  }

  static Future<void> saveData(APIUser apiUser, bool rememberMe) async {
    await openBox();
    await box.put('user', apiUser);
    if (rememberMe) {
      await box.put('rememberMe', rememberMe);
    }
  }

  static Future<APIUser> loadUserData() async {
    await openBox();
    return await box.get('user') as APIUser;
  }

  static Future<String> loadUserToken() async {
    await openBox();
    return box.get('token') as String;
  }

  static Future<bool> loadRememberMe() async {
    await openBox();
    final result = await box.get('rememberMe');
    if (result == null) {
      return false;
    } else {
      return result as bool;
    }
  }

  static Future<void> deleteSavedData() async {
    await openBox();
    box.delete('user');
    box.delete('token');
    await box.put('rememberMe', false);
    box.close();
  }
}
