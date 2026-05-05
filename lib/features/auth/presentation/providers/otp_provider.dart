import 'dart:async';
import 'package:flutter/material.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/features/auth/presentation/pages/otp_page.dart';
import 'package:start/features/auth/presentation/providers/otp_operations.dart';

class OtpProvider extends ChangeNotifier {
  // final UserUseCases authUseCase;
  // OtpProvider(this.authUseCase);
  // late String theHashCode;
  Timer? timer;
  int counter = 60;
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  void rebuild() {
    notifyListeners();
  }

  void reset() {
    counter = 60;
    otpController = TextEditingController();
  }

  void goTo() {
    // otpController = TextEditingController();
    // final loginProvider = Provider.of<LoginProvider>(Constants.globalContext(),listen: false);
    // otpNumber = loginProvider.phoneNumber();
    reset();
    navP(const OtpPage());
    startTimer();
  }
}
