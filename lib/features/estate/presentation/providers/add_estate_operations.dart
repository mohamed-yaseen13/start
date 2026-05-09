import 'package:image_picker/image_picker.dart';
import 'package:start/features/estate/presentation/providers/add_estate_provider.dart';

extension AddEstateOperations on AddEstateProvider {
  void setIsSell(bool newValue) {
    isSell = newValue;
    rebuild();
  }

  void addImages(List<XFile> images) {
    // this.images.addAll(images);
  }

  void deleteImage(int index) {
    // images.removeAt(index);
  }

  void initInputs() {}

  void resetStepOne() {
    isSell = true;
    images = [];
  }

  void summitStepOne() {
    if (formKey.currentState!.validate()) {
      goToSecondStep();
    }
  }
}
