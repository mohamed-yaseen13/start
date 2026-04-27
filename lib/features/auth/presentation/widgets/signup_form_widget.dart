import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_color.dart';
import 'package:start/core/Theme/app_text_styles.dart';
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
    SignupProvider signup = Provider.of<SignupProvider>(context);

    return Form(
      key: signup.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTextFieldWidget(
            inputs: signup.signupInputs,
            color: AppColor.mainColor,
            borderColor: AppColor.secondaryGray2,
          ),
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
                style: AppTextStyles.body,
              ),
            ],
          ),
          ValidationWidget(
            conditions: [
              {
                "value": signup.isAcceptTerms == false,
                "text": "يجب الموافقة علي الشروط",
              },
            ],
          ),
          SizedBox(height: 24.h),
          ButtonWidget(
            onTap: () {
              FocusScope.of(context).unfocus();
              signup.submitSignupForm();
            },
            text: LanguageProvider.translate('signup', 'signup'),
          ),
        ],
      ),
    );
  }
}
