import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/features/auth/presentation/providers/otp_provider.dart';
import 'package:start/features/auth/presentation/widgets/otp_form_widget.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OtpProvider otp = Provider.of<OtpProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanguageProvider.translate('otp', 'enter_otp'),
                style: context.text.titleMedium!.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 24.h),
              Text(
                LanguageProvider.translate('otp', 'otp_text'),
                style: context.text.bodyMedium!.copyWith(
                  color: context.colors.secondary,
                ),
              ),
              SizedBox(height: 128.h),
              OtpFormWidget(),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageProvider.translate('otp', 'dont_receive_otp'),
                    style: context.text.bodySmall,
                  ),
                  SizedBox(width: 4.w),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      LanguageProvider.translate('otp', 'resend_otp'),
                      style: context.text.bodySmall!.copyWith(
                        color: otp.counter == 0 ? context.colors.primary : null,
                      ),
                    ),
                  ),
                ],
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
                otp.submitOtpForm();
              },
              text: 'verify',
            ),
          ],
        ),
      ),
    );
  }
}
