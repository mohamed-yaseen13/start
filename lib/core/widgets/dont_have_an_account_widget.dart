import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/core/theme/app_text_styles.dart';
import 'package:start/features/auth/presentation/providers/signup_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<SignupProvider>(context, listen: false).goToPage();
      },
      child: Text(
        LanguageProvider.translate('login', 'dont_have_an_account'),
        style: AppTextStyles.body,
      ),
    );
  }
}
