import 'package:flutter/material.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/auth/presentation/pages/login_page.dart';
import 'package:start/features/auth/presentation/providers/login_operations.dart';

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  bool isRememberMe = false;
  bool isObscureText = true;
  List<TextFieldModel> loginInputs = [];

  void goTo() {
    reset();
    initInputs();
    navPARU(LoginPage());
  }

  void rebuild() {
    notifyListeners();
  }

  void reset() {
    isRememberMe = false;
    isObscureText = true;
    loginInputs = [];
  }
}
