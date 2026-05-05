import 'package:flutter/material.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/auth/presentation/pages/create_new_password_page.dart';
import 'package:start/features/auth/presentation/providers/create_new_password_operations.dart';

class CreateNewPasswordProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  List<TextFieldModel> createNewPasswordInputs = [];

  void reset() {
    createNewPasswordInputs = [];
  }

  void goTo() {
    reset();
    initInputs();
    navP(CreateNewPasswordPage());
  }
}
