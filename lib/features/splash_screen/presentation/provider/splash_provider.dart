import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import '../../../../core/helper_function/helper_function.dart';

class SplashProvider extends ChangeNotifier {
  void startApp() async {
    await Future.wait([
      // Provider.of<SettingsProvider>(Constants.globalContext(), listen: false).getSettings(),
      // Provider.of<CategoriesProvider>(Constants.globalContext(), listen: false).refresh(),
      // Provider.of<CityProvider>(Constants.globalContext(), listen: false).getCities(),
    ]);
    await delay(1000);
    // isEndAnimation= true;
    // var settingsProvider = Provider.of<SettingsProvider>(Constants.globalContext(),listen: false);
    // SettingsEntity? settings = settingsProvider.settingsEntity;
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // if(int.parse(packageInfo.buildNumber)<settings!.version){
    //   await updateDialog(settings.mustUpdate);
    //   if(settings.mustUpdate){
    //     return;
    //   }
    // }

    // String? login = sharedPreferences.getString('token');
    // if(login !=null){
    //     Provider.of<AuthProvider>(Constants.globalContext(),listen: false).getProfile(fromSplash: true);
    // }else{
    //   Provider.of<AuthProvider>(Constants.globalContext(), listen: false).goToLoginPage();
    // }
  }

  void clear() {
    // introEntity = null;
    notifyListeners();
  }
}
