import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/core/widgets/custom_bottom_nav_bar_widget.dart';
import 'package:start/core/widgets/divider_widget.dart';
import 'package:start/core/widgets/dont_have_an_account_widget.dart';
import 'package:start/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:start/features/auth/presentation/widgets/login/login_form_widget.dart';
import 'package:start/features/auth/presentation/widgets/login/login_with_social_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImages.authTopImage),
          SizedBox(height: 24.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeaderWidget(title: 'hi', decs: 'login_text'),
                    SizedBox(height: 24.h),
                    LoginFormWidget(),
                    SizedBox(height: 24.h),
                    DividerWidget(),
                    SizedBox(height: 32.h),
                    LoginWithSocialWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWidget(
        child: DontHaveAnAccountWidget(),
      ),
    );
  }
}
