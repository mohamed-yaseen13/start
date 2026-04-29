import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/constants/constants.dart';
import 'package:start/core/dialog/snack_bar.dart';
import 'package:start/core/helper_function/helper_function.dart';
import 'package:start/core/helper_function/loading.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/helper_function/text_form_field_validation.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/auth/presentation/pages/create_new_password_page.dart';
import 'package:start/features/auth/presentation/pages/create_new_password_success_page.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class CreateNewPasswordProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  List<TextFieldModel> get createNewPasswordInputs => [
    TextFieldModel(
      key: "password",
      title: Text(
        LanguageProvider.translate('new_password', "new_password"),
        style: Constants.globalContext().text.titleMedium!.copyWith(
          fontSize: 14.sp,
        ),
      ),
      controller: passwordController,
      validator: (value) => validatePassword(value!),
      obscureText: true,
      hint: LanguageProvider.translate('auth', 'password'),
    ),
    TextFieldModel(
      key: "confirm_password",
      title: Text(
        LanguageProvider.translate('new_password', "confirm_new_password"),
        style: Constants.globalContext().text.titleMedium!.copyWith(
          fontSize: 14.sp,
        ),
      ),
      controller: confirmPasswordController,
      validator: (value) =>
          validateConfirmPassword(value!, passwordController.text),
      obscureText: true,
      next: false,
      hint: LanguageProvider.translate('auth', 'password'),
    ),
  ];

  void goTo() {
    navP(CreateNewPasswordPage());
  }

  Future createNewPasswordButton() async {
    loading();
    await delay(3000);
    navPopLoading();
    navPARU(CreateNewPasswordSuccessPage());
  }

  void submitCreateNewPasswordForm() {
    String nameError = '';
    for (var element in createNewPasswordInputs) {
      if (!formKey.currentState!.validate()) {
        String? error = element.validator!(element.controller.text);
        if (error != null && error.isNotEmpty) {
          nameError += '$error\n';
        }
      }
    }
    if (nameError.isEmpty) {
      createNewPasswordButton();
    } else {
      showToast(nameError.trim());
    }
  }
}
