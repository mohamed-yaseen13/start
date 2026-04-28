import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/core/widgets/list_text_field_widget.dart';
import 'package:start/features/auth/presentation/providers/login_provider.dart';
import 'package:start/features/auth/presentation/widgets/remember_me_and_forgot_password_row_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider login = Provider.of<LoginProvider>(context);
    return Form(
      key: login.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTextFieldWidget(inputs: login.loginInputs),
          SizedBox(height: 12.h),
          RememberMeAndForgotPasswordRowWidget(),
          SizedBox(height: 24.h),
          ButtonWidget(
            onTap: () {
              FocusScope.of(context).unfocus();
              login.submitLoginForm();
            },
            text: 'login',
            textStyle: context.text.bodyMedium!.copyWith(
              fontSize: 18.sp,
              color: context.colors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
