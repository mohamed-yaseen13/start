// import 'dart:async';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rent/features/auth/presentation/provider/profile_provider.dart';
// import '../../../../core/constants/constants.dart';
// import '../../../../core/dialog/snack_bar.dart';
// import '../../../../core/helper_function/loading.dart';
// import '../../../../core/helper_function/navigation.dart';
// import '../../../language/presentation/provider/language_provider.dart';
// import '../../domain/usecases/user_usecases.dart';
// import '../pages/check_otp_page.dart';
// import 'auth_provider.dart';
// import 'otp_operation_provider.dart';
//
// class OtpProvider extends ChangeNotifier {
//   final UserUseCases authUseCase;
//   OtpProvider(this.authUseCase);
//   String otpNumber = "";
//   late String theHashCode;
//   Timer? timer;
//   int counter = 60;
//   final GlobalKey<FormState> formState = GlobalKey();
//   void rebuild(){
//     notifyListeners();
//   }
//
//
//   late TextEditingController otpController;
//
//   Future<void> checkCode({bool isRegister = true}) async {
//     Map<String, dynamic> data = {};
//     data["token"] = await FirebaseMessaging.instance.getToken() ?? "123";
//     data["login"] = isRegister ? 1 : 0;
//     data["phone"] = otpNumber;
//     data["hashed_code"] = theHashCode;
//     data["code"] = otpController.text.trim();
//
//     loading();
//     final result = await authUseCase.checkCode(data);
//     navPopLoading();
//     result.fold((l) => showToast(l.message!), (r) {
//       final profile = Provider.of<ProfileProvider>(Constants.globalContext(),listen: false);
//       profile.successLogin(userEntity: r);
//     });
//   }
//
//   Future<void> sendOtp({bool isResend = false,}) async {
//     Map<String, dynamic> data = {};
//     // data["token"] = await FirebaseMessaging.instance.getToken() ?? "123";
//     data["phone"] = otpNumber;
//     loading();
//     final result = await authUseCase.sendOtp(data);
//     navPopLoading();
//     result.fold((l) => showToast(l.message!), (r) {
//       theHashCode = r;
//       startTimer();
//       if (!isResend) {
//         goToOTPView();
//       }
//     });
//   }
//
//   String sendCode(value) {
//     return "${LanguageProvider.translate("auth", "after")} $value ${LanguageProvider.translate("time", "sec")}";
//   }
//
// }
