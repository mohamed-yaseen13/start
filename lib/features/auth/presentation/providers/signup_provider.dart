import 'package:flutter/material.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/auth/presentation/pages/signup_page.dart';
import 'package:start/features/auth/presentation/providers/signup_operations.dart';

class SignupProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  bool isAcceptTerms = false;
  bool isObscureText = true;
  List<TextFieldModel> signupInputs = [];

  void rebuild() {
    notifyListeners();
  }

  void reset() {
    isAcceptTerms = false;
    isObscureText = true;
    signupInputs = [];
  }

  void goTo() {
    reset();
    initInputs();
    navP(SignupPage());
  }
}
