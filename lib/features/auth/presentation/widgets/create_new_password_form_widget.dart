import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/core/widgets/list_text_field_widget.dart';
import 'package:start/features/auth/presentation/providers/create_new_password_provider.dart';

class CreateNewPasswordFormWidget extends StatelessWidget {
  const CreateNewPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final createNewPassword = context.watch<CreateNewPasswordProvider>();

    return Form(
      key: createNewPassword.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTextFieldWidget(
            inputs: createNewPassword.createNewPasswordInputs,
          ),
        ],
      ),
    );
  }
}
