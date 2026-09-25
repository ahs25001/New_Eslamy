import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesServices {
  static late SharedPreferences _instance ;
  static Future<void> init ()async{
    _instance = await SharedPreferences.getInstance();
  }
  static void addListOfStrings (String key, List<String> value)async{
    await _instance.setStringList(key, value);
    return;
  }
  static List<String> getLisOfStrings (String key){
    return _instance.getStringList(key) ?? [];
  }
  static void clear ()async{
    await _instance.clear();
    return;
  }
}