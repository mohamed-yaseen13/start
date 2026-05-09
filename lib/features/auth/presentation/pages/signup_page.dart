import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/core/widgets/already_have_an_account_widget.dart';
import 'package:start/core/widgets/divider_widget.dart';
import 'package:start/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:start/features/auth/presentation/widgets/login/login_with_social_widget.dart';
import 'package:start/features/auth/presentation/widgets/signup/signup_form_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeaderWidget(title: 'title', decs: 'signup_text'),
              SizedBox(height: 24.h),
              SignupFormWidget(),
              SizedBox(height: 24.h),
              DividerWidget(),
              SizedBox(height: 32.h),
              LoginWithSocialWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 48.h, top: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [AlreadyHaveAnAccountWidget()],
        ),
      ),
    );
  }
}
