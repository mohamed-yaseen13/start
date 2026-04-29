import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/features/auth/presentation/providers/create_new_password_provider.dart';
import 'package:start/features/auth/presentation/widgets/create_new_password_form_widget.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final createNewPassword = context.watch<CreateNewPasswordProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanguageProvider.translate(
                  'new_password',
                  'create_new_password',
                ),
                style: context.text.titleMedium!.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 24.h),
              Text(
                LanguageProvider.translate('new_password', 'new_password_text'),
                style: context.text.bodyMedium!.copyWith(
                  color: context.colors.secondary,
                ),
              ),
              SizedBox(height: 48.h),
              CreateNewPasswordFormWidget(),
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
                createNewPassword.submitCreateNewPasswordForm();
              },
              text: 'change_password',
            ),
          ],
        ),
      ),
    );
  }
}
