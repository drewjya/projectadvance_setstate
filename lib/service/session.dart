import 'package:hive/hive.dart';

class Session {
  static read() async {
    var box = await Hive.openBox('user');
    return box.get("session");
  }

  static write(String username, String password) async {
    var box = await Hive.openBox('user');
    return box.put("session", {"username": username, "password": password});
  }
}
