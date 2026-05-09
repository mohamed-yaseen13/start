import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/estate/presentation/pages/add_estate_page_step_one.dart';
import 'package:start/features/estate/presentation/pages/add_estate_page_step_two.dart';
import 'package:start/features/estate/presentation/providers/add_estate_operations.dart';

class AddEstateProvider extends ChangeNotifier {
  bool isSell = true;
  List<XFile> images = [];
  int currentIndex = 0;
  LatLng? latLng;
  List<TextFieldModel> stepTwoInputs = [];
  List<TextFieldModel> stepThreeInputs = [];
  final formKey = GlobalKey<FormState>();

  void goTo() {
    resetStepOne();
    navP(AddEstatePageStepOne());
  }

  void rebuild() {
    notifyListeners();
  }

  void goToSecondStep() {
    navP(AddEstatePageStepTwo());
  }
}
