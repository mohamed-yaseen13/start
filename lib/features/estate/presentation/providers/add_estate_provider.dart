import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/estate/presentation/pages/add_estate_page_step1.dart';
import 'package:start/features/estate/presentation/pages/add_estate_page_step3.dart';
import 'package:start/features/estate/presentation/pages/add_estate_page_step2.dart';
import 'package:start/features/estate/presentation/providers/add_estate_operations.dart';
import 'package:start/features/nav/presentation/views/nav_bar_view.dart';

class AddEstateProvider extends ChangeNotifier {
  bool isSell = true;
  List<XFile> images = [];
  int currentIndex = 0;
  LatLng? latLng;
  List<TextFieldModel> stepTwoInputs = [];
  List<TextFieldModel> stepThreeInputs = [];
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  void goTo() {
    resetStepOne();
    navP(AddEstatePageStep1());
  }

  void rebuild() {
    notifyListeners();
  }

  void goToSecondStep() {
    initStepTwoInputs();
    navP(AddEstatePageStep2());
  }

  void goToThirdStep() {
    initStepThreeInputs();
    navP(AddEstatePageStep3());
  }

  void uploadEstate() {
    navPARU(NavBarView());
  }
}
