import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/core/widgets/custom_bottom_nav_bar_widget.dart';
import 'package:start/features/auth/presentation/providers/otp_operations.dart';
import 'package:start/features/auth/presentation/providers/otp_provider.dart';
import 'package:start/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:start/features/auth/presentation/widgets/otp/otp_form_widget.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final otp = context.watch<OtpProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeaderWidget(title: 'enter_otp', decs: 'otp_text'),
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
      bottomNavigationBar: CustomBottomNavBarWidget(
        child: ButtonWidget(
          onTap: () {
            FocusScope.of(context).unfocus();
            otp.submitOtpForm();
          },
          text: 'verify',
        ),
      ),
    );
  }
}
