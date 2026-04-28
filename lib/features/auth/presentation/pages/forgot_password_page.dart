import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/features/auth/presentation/providers/forgot_password_provider.dart';
import 'package:start/features/auth/presentation/widgets/forgot_password_form_widget.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordProvider forgotPassword = Provider.of<ForgotPasswordProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LanguageProvider.translate('login', 'forgot_password'),
              style: context.text.titleMedium!.copyWith(fontSize: 20.sp),
            ),
            SizedBox(height: 12.h),
            Text(
              LanguageProvider.translate('forgot_password', 'forgot_password'),
              style: context.text.bodyMedium!.copyWith(
                color: context.colors.tertiary,
              ),
            ),
            SizedBox(height: 32.h),
            ForgotPasswordFormWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 48.h, top: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonWidget(
              onTap: () {
                FocusScope.of(context).unfocus();
                forgotPassword.submitForgotPasswordForm();
              },
              text: 'continue',
            ),
          ],
        ),
      ),
    );
  }
}
