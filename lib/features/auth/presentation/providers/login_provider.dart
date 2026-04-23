import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_text_styles.dart';
import 'package:start/core/constants/constants.dart';
import 'package:start/core/dialog/snack_bar.dart';
import 'package:start/core/helper_function/helper_function.dart';
import 'package:start/core/helper_function/loading.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/helper_function/text_form_field_validation.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/auth/presentation/pages/login_page.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';
import 'package:start/features/start/providers/start_provider.dart';

class LoginProvider extends ChangeNotifier {
  List<TextFieldModel> loginInputs = [];
  final formKey = GlobalKey<FormState>();

  bool isRememberMe = false;
  void toggleRememberMe() {
    isRememberMe = !isRememberMe;
    notifyListeners();
  }

  bool isObscureText = true;
  void toggleObscureText() {
    isObscureText = !isObscureText;
    notifyListeners();
  }

  void goToPage() {
    loginInputs = [
      TextFieldModel(
        key: "phone",
        controller: TextEditingController(),
        title: Text(
          LanguageProvider.translate('login', "phone_number"),
          style: AppTextStyles.title.copyWith(fontSize: 14.sp),
        ),
        textInputType: TextInputType.phone,
        validator: (value) => validatePhone(value!),
        next: true,
      ),
      TextFieldModel(
        key: "password",
        title: Text(
          LanguageProvider.translate('login', "password"),
          style: AppTextStyles.title.copyWith(fontSize: 14.sp),
        ),
        controller: TextEditingController(),
        validator: (value) => validatePassword(value!),
        obscureText: isObscureText,
        next: false,
        suffix: GestureDetector(
          onTap: toggleObscureText, // i don't know why it's not working
          child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    ];
    navPARU(LoginPage());
  }

  Future loginButton() async {
    // String token = await FirebaseMessaging.instance.getToken() ?? "123";
    // Map<String, dynamic> data = {};
    // for (var element in loginInputs) {
    // data[element.key] = element.controller.text;
    // }
    // data['token'] = token;
    // data['remember_me'] = isRememberMe; // i added this [ mohamed yaseen ]
    loading();
    delay(1000); // i added this [ mohamed yaseen ] just for test
    // Either<DioException, UserEntity> login = await UserUseCases(sl()).login(data);
    navPopLoading();
    Provider.of<StartProvider>(
      Constants.globalContext(),
      listen: false,
    ).goToPage();
    // login.fold((l) {
    //   showToast(l.message!);
    // }, (r) async {
    //   final provider = Provider.of<ProfileProvider>(Constants.globalContext(),listen: false);
    //   provider.successLogin(userEntity: r);
    // });
  }

  void submitLoginForm() {
    String nameError = '';

    for (var element in loginInputs) {
      if (!formKey.currentState!.validate()) {
        String? error = element.validator!(element.controller.text);
        if (error != null && error.isNotEmpty) {
          nameError += '$error\n';
        }
      }
    }
    if (nameError.isEmpty) {
      loginButton();
    } else {
      showToast(nameError.trim());
    }
  }
}
