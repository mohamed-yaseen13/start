import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/core/widgets/custom_bottom_nav_bar_widget.dart';
import 'package:start/features/auth/presentation/providers/create_new_password_operations.dart';
import 'package:start/features/auth/presentation/providers/create_new_password_provider.dart';
import 'package:start/features/auth/presentation/widgets/create_new_password/create_new_password_form_widget.dart';
import 'package:start/features/auth/presentation/widgets/auth_header_widget.dart';

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
              AuthHeaderWidget(
                title: 'create_new_password',
                decs: 'new_password_text',
              ),
              SizedBox(height: 48.h),
              CreateNewPasswordFormWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarWidget(
        child: ButtonWidget(
          onTap: () {
            FocusScope.of(context).unfocus();
            createNewPassword.submitCreateNewPasswordForm();
          },
          text: 'change_password',
        ),
      ),
    );
  }
}
