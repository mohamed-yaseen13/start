import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_color.dart';
import 'package:start/core/theme/app_text_styles.dart';
import 'package:start/core/widgets/checkbox_widget.dart';
import 'package:start/features/auth/presentation/providers/login_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class RememberMeAndForgotPasswordRowWidget extends StatelessWidget {
  const RememberMeAndForgotPasswordRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider login = Provider.of<LoginProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CheckBoxWidget(
          check: login.isRememberMe,
          onChange: (value) {
            login.toggleRememberMe();
          },
        ),
        GestureDetector(
          onTap: () {
            // ResetPasswordProvider.goto
          },
          child: Text(
            LanguageProvider.translate('login', 'forgot_password'),
            style: AppTextStyles.body.copyWith(color: AppColor.primaryDarkBlue),
          ),
        ),
      ],
    );
  }
}
