import 'package:flutter/material.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:start/features/auth/presentation/providers/forgot_password_operations.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  List<TextFieldModel> forgotPasswordInputs = [];

  void reset() {
    forgotPasswordInputs = [];
  }

  void goTo() {
    reset();
    initInputs();
    navP(ForgotPasswordPage());
  }
}
