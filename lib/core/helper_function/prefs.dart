import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
Future startSharedPref() async {
  // SharedPreferences.resetStatic();
  sharedPreferences = await SharedPreferences.getInstance();
}
