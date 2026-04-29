import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/features/auth/presentation/providers/signup_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class CreateNewPasswordSuccessPage extends StatelessWidget {
  const CreateNewPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppImages.createNewPasswordSuccessImage),
              SizedBox(height: 12.h),
              Text(
                LanguageProvider.translate(
                  'new_password',
                  'new_password_success',
                ),
                style: context.text.titleMedium!.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 12.h),
              Text(
                LanguageProvider.translate(
                  'new_password',
                  'new_password_success_text',
                ),
                style: context.text.bodyMedium!.copyWith(
                  color: context.colors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
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
                context.read<SignupProvider>().goTo();
              },
              text: 'go_to_signup_page',
            ),
          ],
        ),
      ),
    );
  }
}
