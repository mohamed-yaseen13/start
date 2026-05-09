import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/features/auth/presentation/providers/forgot_password_operations.dart';
import 'package:start/features/auth/presentation/providers/forgot_password_provider.dart';
import 'package:start/features/auth/presentation/widgets/forgot_password/forgot_password_form_widget.dart';
import 'package:start/features/auth/presentation/widgets/auth_header_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotPassword = context.watch<ForgotPasswordProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeaderWidget(
                title: 'forgot_password_title',
                decs: 'forgot_password_decs',
              ),
              SizedBox(height: 32.h),
              ForgotPasswordFormWidget(),
            ],
          ),
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
