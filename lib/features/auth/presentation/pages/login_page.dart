import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/core/widgets/divider_widget.dart';
import 'package:start/core/widgets/dont_have_an_account_widget.dart';
import 'package:start/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:start/features/auth/presentation/widgets/login_with_social_widget.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

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
                    Text(
                      LanguageProvider.translate('login', 'hi'),
                      style: context.text.titleMedium!.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      LanguageProvider.translate('login', 'login_text'),
                      style: context.text.bodyMedium!.copyWith(
                        color: context.colors.secondary,
                      ),
                    ),
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 48.h, top: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [DontHaveAnAccountWidget()],
        ),
      ),
    );
  }
}
