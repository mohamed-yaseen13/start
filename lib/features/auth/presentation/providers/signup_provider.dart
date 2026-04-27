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
import 'package:start/features/auth/presentation/pages/signup_page.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';
import 'package:start/features/start/providers/start_provider.dart';

class SignupProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  bool isAcceptTerms = false;

  void toggleAcceptTerms() {
    isAcceptTerms = !isAcceptTerms;
    notifyListeners();
  }

  bool isObscureText = true;
  void toggleObscureText() {
    isObscureText = !isObscureText;
    notifyListeners();
  }

  List<TextFieldModel> get signupInputs => [
    TextFieldModel(
      key: "phone",
      controller: phoneController,
      title: Text(
        LanguageProvider.translate('auth', "phone_number"),
        style: AppTextStyles.title.copyWith(fontSize: 14.sp),
      ),
      textInputType: TextInputType.phone,
      validator: (value) => validatePhone(value!),
      next: true,
    ),
    TextFieldModel(
      key: "name",
      controller: nameController,
      title: Text(
        LanguageProvider.translate('signup', "user_name"),
        style: AppTextStyles.title.copyWith(fontSize: 14.sp),
      ),
      validator: (value) => validateFirstName(value!),
      next: true,
    ),
    TextFieldModel(
      key: "password",
      title: Text(
        LanguageProvider.translate('auth', "password"),
        style: AppTextStyles.title.copyWith(fontSize: 14.sp),
      ),
      controller: passwordController,
      validator: (value) => validatePassword(value!),
      obscureText: isObscureText,
      next: false,
      suffix: GestureDetector(
        onTap: toggleObscureText,
        child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
      ),
    ),
  ];

  void goToPage() {
    navP(SignupPage());
  }

  Future signupButton() async {
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

  void submitSignupForm() {
    String nameError = '';

    for (var element in signupInputs) {
      if (!formKey.currentState!.validate()) {
        String? error = element.validator!(element.controller.text);
        if (error != null && error.isNotEmpty) {
          nameError += '$error\n';
        }
      }
    }
    if (nameError.isEmpty) {
      signupButton();
    } else {
      showToast(nameError.trim());
    }
  }
}
