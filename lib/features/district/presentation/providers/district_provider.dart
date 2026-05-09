import 'package:flutter/material.dart';
import 'package:start/core/models/drop_down_class.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class District {
  final int id;
  final String name;

  District({required this.id, required this.name});
}

class DistrictProvider extends ChangeNotifier
    implements DropDownClass<District> {
  List<District> items = [District(id: 1, name: 'حي النرجس')];
  District? selectedDistrict;

  @override
  String displayedName() {
    return selectedDistrict?.name ??
        LanguageProvider.translate('district', 'select_district');
  }

  @override
  String displayedOptionName(District type) {
    return type.name;
  }

  @override
  Widget? displayedOptionWidget(District type) {
    return null;
  }

  @override
  Widget? displayedWidget() {
    return null;
  }

  @override
  List<District>? list() {
    return items;
  }

  @override
  Future<dynamic> onTap(District? data) async {
    selectedDistrict = data;
    notifyListeners();
  }

  @override
  bool require() {
    return false;
  }

  @override
  District? selected() {
    return selectedDistrict;
  }

  @override
  String? titleName() {
    return null;
  }

  @override
  value() {
    return selectedDistrict?.id;
  }
}
