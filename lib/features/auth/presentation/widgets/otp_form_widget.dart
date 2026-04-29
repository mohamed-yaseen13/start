import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/helper_function/convert.dart';
import 'package:start/core/widgets/validation_widget.dart';
import 'package:start/features/auth/presentation/providers/otp_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:start/features/auth/presentation/widgets/timer_widget.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class OtpFormWidget extends StatelessWidget {
  const OtpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final otp = context.watch<OtpProvider>();
    final defaultPinTheme = PinTheme(
      width: 90.w,
      height: 70.h,
      textStyle: context.text.titleMedium!.copyWith(
        fontSize: 20.sp,
        color: context.colors.primary,
      ),
      decoration: BoxDecoration(
        color: context.colors.tertiary,
        border: Border.all(color: context.colors.tertiary),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    return Form(
      key: otp.formKey,
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  border: Border.all(color: context.colors.primary),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              separatorBuilder: (index) => SizedBox(width: 10.w),
              animationDuration: const Duration(milliseconds: 300),
              onCompleted: (v) => otp.getOtp(v),
            ),
          ),
          ValidationWidget(
            conditions: [
              {
                'value': otp.otpCode.length != 4,
                'text': LanguageProvider.translate('validation', 'otp_invalid'),
              },
            ],
          ),
          SizedBox(height: 24.h),
          TimerWidget(counter: convertSecToMin(otp.counter)),
        ],
      ),
    );
  }
}
