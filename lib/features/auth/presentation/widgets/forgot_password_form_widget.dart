import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/core/widgets/list_text_field_widget.dart';
import 'package:start/features/auth/presentation/providers/forgot_password_provider.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordProvider forgotPassword = Provider.of<ForgotPasswordProvider>(
      context,
    );

    return Form(
      key: forgotPassword.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTextFieldWidget(inputs: forgotPassword.forgotPasswordInputs),
        ],
      ),
    );
  }
}
