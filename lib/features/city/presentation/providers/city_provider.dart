import 'package:flutter/material.dart';
import 'package:start/core/models/drop_down_class.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class City {
  final int id;
  final String name;

  City({required this.id, required this.name});
}

class CityProvider extends ChangeNotifier implements DropDownClass<City> {
  List<City> cities = [
    City(id: 1, name: 'جده'),
    City(id: 2, name: 'الرياض'),
    City(id: 3, name: 'ابو ظبي'),
    City(id: 4, name: 'الدمام'),
  ];

  City? selectedCity;

  @override
  String displayedName() {
    return selectedCity?.name ??
        LanguageProvider.translate('city', 'select_city');
  }

  @override
  String displayedOptionName(City type) {
    return type.name;
  }

  @override
  Widget? displayedOptionWidget(City type) {
    return null;
  }

  @override
  Widget? displayedWidget() {
    return null;
  }

  @override
  List<City>? list() {
    return cities;
  }

  @override
  Future<dynamic> onTap(City? data) async {
    selectedCity = data;
    notifyListeners();
  }

  @override
  bool require() {
    return false;
  }

  @override
  City? selected() {
    return selectedCity;
  }

  @override
  String? titleName() {
    return null;
  }

  @override
  value() {
    return selectedCity?.id;
  }
}
