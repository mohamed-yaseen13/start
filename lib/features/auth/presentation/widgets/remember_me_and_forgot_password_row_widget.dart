import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/checkbox_widget.dart';
import 'package:start/features/auth/presentation/providers/forgot_password_provider.dart';
import 'package:start/features/auth/presentation/providers/login_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class RememberMeAndForgotPasswordRowWidget extends StatelessWidget {
  const RememberMeAndForgotPasswordRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final login = context.watch<LoginProvider>();
    return Row(
      children: [
        CheckBoxWidget(
          width: 16.w,
          height: 16.h,
          check: login.isRememberMe,
          onChange: (value) {
            login.toggleRememberMe();
          },
        ),
        SizedBox(width: 8.w),
        Text(LanguageProvider.translate('login', 'remember_me')),
        Spacer(),
        GestureDetector(
          onTap: () {
            Provider.of<ForgotPasswordProvider>(context, listen: false).goTo();
          },
          child: Text(
            LanguageProvider.translate('login', 'forgot_password'),
            style: context.text.bodyMedium!.copyWith(
              color: context.colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
