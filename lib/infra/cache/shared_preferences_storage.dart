import 'package:atv_flutter_03/application/contracts/get_storage.dart';
import 'package:atv_flutter_03/application/contracts/set_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements GetStorage, SetStorage {
  @override
  Future getValue(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getString(key);
  }

  @override
  Future<void> setValue(String key, value) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString(key, value);
  }
}
