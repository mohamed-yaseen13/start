import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_text_styles.dart';
import 'package:start/features/auth/presentation/providers/login_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Provider.of<LoginProvider>(context, listen: false).goToPage();
        },
        child: Text(
          LanguageProvider.translate('signup', 'already_have_an_account'),
          style: AppTextStyles.body,
        ),
      ),
    );
  }
}
