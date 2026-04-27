import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/theme_provider.dart';
import 'package:start/core/models/progress_provider.dart';
import 'package:start/features/auth/presentation/providers/login_provider.dart';
import 'package:start/features/auth/presentation/providers/signup_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';
import 'package:start/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:start/features/splash_screen/presentation/provider/splash_provider.dart';
import 'package:start/features/start/providers/start_provider.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({super.key, required this.child, required this.language});
  final Widget child;
  final LanguageProvider language;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => language),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => StartProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
      ],
      child: child,
    );
  }
}
