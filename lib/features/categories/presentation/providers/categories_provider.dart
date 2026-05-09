import 'package:flutter/material.dart';
import 'package:start/core/models/drop_down_class.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class Category {
  int id;
  String name;

  Category({required this.id, required this.name});
}

class CategoriesProvider extends ChangeNotifier
    implements DropDownClass<Category> {
  List<Category> categories = [
    Category(id: 1, name: 'شقة'),
    Category(id: 2, name: 'منزل'),
    Category(id: 3, name: 'فيلا'),
    Category(id: 4, name: 'محل'),
  ];
  Category? selectedCategory;

  @override
  String displayedName() {
    return selectedCategory?.name ??
        LanguageProvider.translate('categories', "select_category");
  }

  @override
  String displayedOptionName(Category type) {
    return type.name;
  }

  @override
  Widget? displayedOptionWidget(Category type) {
    return null;
  }

  @override
  Widget? displayedWidget() {
    return null;
  }

  @override
  List<Category>? list() {
    return categories;
  }

  @override
  Future<dynamic> onTap(Category? data) async {
    selectedCategory = data;
    notifyListeners();
  }

  @override
  bool require() {
    return false;
  }

  @override
  Category? selected() {
    return selectedCategory;
  }

  @override
  String? titleName() {
    return null;
  }

  @override
  value() {
    return selectedCategory?.id;
  }
}
