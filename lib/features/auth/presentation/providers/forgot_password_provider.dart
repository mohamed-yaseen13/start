import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/constants/constants.dart';
import 'package:start/core/dialog/snack_bar.dart';
import 'package:start/core/helper_function/helper_function.dart';
import 'package:start/core/helper_function/loading.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/helper_function/text_form_field_validation.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:start/features/auth/presentation/providers/otp_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  List<TextFieldModel> forgotPasswordInputs = [
    TextFieldModel(
      key: "phone",
      controller: TextEditingController(),
      title: Text(
        LanguageProvider.translate('auth', "phone_number"),
        style: Constants.globalContext().text.titleMedium!.copyWith(
          fontSize: 14.sp,
        ),
      ),
      textInputType: TextInputType.phone,
      validator: (value) => validatePhone(value!),
      next: true,
    ),
  ];

  Future forgotPasswordButton() async {
    // String token = await FirebaseMessaging.instance.getToken() ?? "123";
    // Map<String, dynamic> data = {};
    // for (var element in loginInputs) {
    // data[element.key] = element.controller.text;
    // }
    // data['token'] = token;
    // data['remember_me'] = isRememberMe; // i added this [ mohamed yaseen ]
    loading();
    await delay(3000); // i added this [ mohamed yaseen ] just for test
    // Either<DioException, UserEntity> login = await UserUseCases(sl()).login(data);
    navPopLoading();
    Provider.of<OtpProvider>(Constants.globalContext(), listen: false).goTo();
    // login.fold((l) {
    //   showToast(l.message!);
    // }, (r) async {
    //   final provider = Provider.of<ProfileProvider>(Constants.globalContext(),listen: false);
    //   provider.successLogin(userEntity: r);
    // });
  }

  void submitForgotPasswordForm() {
    String nameError = '';
    for (var element in forgotPasswordInputs) {
      if (!formKey.currentState!.validate()) {
        String? error = element.validator!(element.controller.text);
        if (error != null && error.isNotEmpty) {
          nameError += '$error\n';
        }
      }
    }
    if (nameError.isEmpty) {
      forgotPasswordButton();
    } else {
      showToast(nameError.trim());
    }
  }

  void goTo() {
    navP(ForgotPasswordPage());
  }
}
