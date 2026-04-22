import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/core/theme/app_color.dart';
import 'package:start/core/theme/app_text_styles.dart';
import 'package:start/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppImages.authTopImage),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageProvider.translate('login', 'hi'),
                    style: AppTextStyles.title.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    LanguageProvider.translate('login', 'login_text'),
                    style: AppTextStyles.body.copyWith(
                      color: AppColor.secondaryGray4,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  LoginFormWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
