//
//
//
// import 'package:provider/provider.dart';
// import 'package:rent/core/constants/constants.dart';
// import 'package:rent/features/auth/presentation/provider/login_provider.dart';
// import 'package:rent/features/auth/presentation/provider/profile_provider.dart';
//
// import '../../../../core/dialog/confirm_dialog.dart';
// import '../../../../core/helper_function/prefs.dart';
// import '../../../language/presentation/provider/language_provider.dart';
//
// extension ProfileOperationProvider on ProfileProvider{
//
//   void setUserEntity(UserEntity userEntity){
//     this.userEntity = userEntity;
//     rebuild();
//   }
//
//   void successLogin({required UserEntity userEntity,}) async {
//     this.userEntity = userEntity;
//     if (userEntity.token != null) {
//       ApiHandel.getInstance.updateHeader(userEntity.token!);
//     }
//     if (userEntity.name != null) {
//       if (userEntity.token != null) {
//         sharedPreferences.setString('token', userEntity.token!);
//       }
//       Provider.of<MainProvider>(Constants.globalContext(), listen: false).goToMainPage();
//     } else {
//       Provider.of<UpdateProfileProvider>(Constants.globalContext(), listen: false).goToRegisterPage();
//     }
//   }
//
//   void logout() async {
//     if(isGuest()){
//       successLogout();
//     }else{
//       Map<String, dynamic> data = {};
//       token = await FirebaseMessaging.instance.getToken() ?? "123";
//
//       // AccessTokenFireBase accessTokenGetter = AccessTokenFireBase();
//       // String token = await accessTokenGetter.getAccessToken();
//       data['token'] = token;
//       UserUseCases(sl()).logout(data);
//       successLogout();
//     }
//   }
//
//   void deleteAccount() async {
//     Either<DioException, bool> login = await UserUseCases(sl()).deleteAccount();
//     login.fold((l) {
//       showToast(l.message!);
//     }, (r) async {
//       successLogout();
//       rebuild();
//     });
//   }
//
//   void confirmDeleteAccount() {
//     confirmDialog(LanguageProvider.translate('auth', "delete_account_title"),
//         LanguageProvider.translate('auth', "delete_account"), () {
//           deleteAccount();
//         });
//   }
//
//   void confirmLogoutAccount() {
//     confirmDialog(LanguageProvider.translate('auth', "logout_title"),
//         LanguageProvider.translate('auth', "logout"), () {
//           logout();
//         });
//   }
//
//   void successLogout() {
//     userEntity = null;
//     sharedPreferences.remove('token');
//     final login = Provider.of<LoginProvider>(Constants.globalContext(),listen: false);
//     for (var i in login.loginInputs) {
//       i.controller.clear();
//     }
//     login.goToLoginPage();
//   }
// }