import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/core/constants/constants.dart';
import 'package:start/core/helper_function/helper_function.dart';
import 'package:start/core/helper_function/loading.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/features/auth/presentation/pages/otp_page.dart';
import 'package:start/features/start/providers/start_provider.dart';

class OtpProvider extends ChangeNotifier {
  // final UserUseCases authUseCase;
  // OtpProvider(this.authUseCase);
  String otpCode = "";
  // late String theHashCode;
  Timer? timer;
  int counter = 60;
  final formKey = GlobalKey<FormState>();
  // final otpController = TextEditingController();

  void getOtp(String value) => otpCode = value;

  void startTimer() {
    counter = 60;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (e) {
      if (timer?.isActive ?? false) {
        try {
          counter--;
          notifyListeners();
        } catch (error) {
          debugPrint("$error");
        }
      }
      if (counter == 0) {
        e.cancel();
      }
    });
    notifyListeners();
  }

  void stopTimer() {
    timer?.cancel();
  }

  void goTo() {
    // otpController = TextEditingController();
    // final loginProvider = Provider.of<LoginProvider>(Constants.globalContext(),listen: false);
    // otpNumber = loginProvider.phoneNumber();
    navP(const OtpPage());
    startTimer();
  }

  void submitOtpForm() {
    if (formKey.currentState!.validate()) {
      if (otpCode.length == 4) {
        checkCode();
      }
    }
  }

  Future<void> checkCode(
    // {bool isRegister = true}
  ) async {
    // Map<String, dynamic> data = {};
    // data["token"] = await FirebaseMessaging.instance.getToken() ?? "123";
    // data["login"] = isRegister ? 1 : 0;
    // data["phone"] = otpNumber;
    // data["hashed_code"] = theHashCode;
    // data["code"] = otpController.text.trim();

    loading();
    // final result = await authUseCase.checkCode(data);
    await delay(300);
    navPopLoading();
    Provider.of<StartProvider>(
      // TODO : create new password provider go to
      Constants.globalContext(),
      listen: false,
    ).goToPage();
    // result.fold((l) => showToast(l.message!), (r) {
    //   final profile = Provider.of<ProfileProvider>(
    //     Constants.globalContext(),
    //     listen: false,
    //   );
    //   profile.successLogin(userEntity: r);
    // });
  }

  // Future<void> sendOtp({bool isResend = false}) async {
  //   Map<String, dynamic> data = {};
  //   // data["token"] = await FirebaseMessaging.instance.getToken() ?? "123";
  //   data["phone"] = otpNumber;
  //   loading();
  //   final result = await authUseCase.sendOtp(data);
  //   navPopLoading();
  //   result.fold((l) => showToast(l.message!), (r) {
  //     theHashCode = r;
  //     startTimer();
  //     if (!isResend) {
  //       goToOTPView();
  //     }
  //   });
  // }

  // String sendCode(value) {
  //   return "${LanguageProvider.translate("auth", "after")} $value ${LanguageProvider.translate("time", "sec")}";
  // }
}
