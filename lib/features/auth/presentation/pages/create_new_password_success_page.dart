import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/core/widgets/custom_bottom_nav_bar_widget.dart';
import 'package:start/features/auth/presentation/providers/signup_provider.dart';
import 'package:start/features/auth/presentation/widgets/auth_header_widget.dart';

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
              AuthHeaderWidget(
                title: 'new_password_success',
                decs: 'new_password_success_text',
                isCentered: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarWidget(
        child: ButtonWidget(
          onTap: () {
            FocusScope.of(context).unfocus();
            context.read<SignupProvider>().goTo();
          },
          text: 'go_to_signup_page',
        ),
      ),
    );
  }
}
