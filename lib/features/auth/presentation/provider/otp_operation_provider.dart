//
// import 'dart:async';
//
// import 'package:flutter/foundation.dart' show debugPrint;
// import 'package:flutter/material.dart' show TextEditingController;
// import 'package:provider/provider.dart';
// import 'package:rent/core/constants/constants.dart';
// import 'package:rent/features/auth/presentation/provider/login_provider.dart';
// import 'package:rent/features/auth/presentation/provider/otp_provider.dart';
//
// import '../../../../core/helper_function/navigation.dart';
//
// extension OtpOperationProvider on OtpProvider{
//   void startTimer() {
//     counter = 60;
//     timer?.cancel();
//     timer = Timer.periodic(const Duration(seconds: 1), (e) {
//       if (timer?.isActive ?? false) {
//         try {
//           counter--;
//           rebuild();
//         } catch (e) {
//           debugPrint("$e");
//         }
//       }
//       if (counter == 0) {
//         e.cancel();
//       }
//     });
//     rebuild();
//   }
//
//   void stopTimer() {
//     timer?.cancel();
//   }
//
//   void goToOTPView() {
//     otpController = TextEditingController();
//     final loginProvider = Provider.of<LoginProvider>(Constants.globalContext(),listen: false);
//     otpNumber = loginProvider.phoneNumber();
//     navP(const CheckOtpPage());
//   }
// }