import 'package:flutter/material.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/features/start/presentation/pages/start_page.dart';

class StartProvider extends ChangeNotifier {
  void goToPage() {
    navPR(StartPage());
  }
}
