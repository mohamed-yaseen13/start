import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/core/widgets/checkbox_widget.dart';
import 'package:start/core/widgets/list_text_field_widget.dart';
import 'package:start/core/widgets/validation_widget.dart';
import 'package:start/features/auth/presentation/providers/signup_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final signup = context.watch<SignupProvider>();

    return Form(
      key: signup.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTextFieldWidget(inputs: signup.signupInputs),
          SizedBox(height: 12.h),
          Row(
            children: [
              CheckBoxWidget(
                width: 16.w,
                height: 16.h,
                check: signup.isAcceptTerms,
                onChange: (value) {
                  signup.toggleAcceptTerms();
                },
              ),
              SizedBox(width: 12.w),
              Text(
                LanguageProvider.translate('signup', 'terms'),
                style: context.text.bodyMedium,
              ),
            ],
          ),
          ValidationWidget(
            conditions: [
              {
                "value": signup.isAcceptTerms == false,
                "text": LanguageProvider.translate('validation', 'terms'),
              },
            ],
          ),
          SizedBox(height: 24.h),
          ButtonWidget(
            onTap: () {
              FocusScope.of(context).unfocus();
              signup.submitSignupForm();
            },
            text: 'signup',
          ),
        ],
      ),
    );
  }
}
