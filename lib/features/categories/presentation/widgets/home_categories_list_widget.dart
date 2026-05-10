import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/constants/constants.dart';
import 'package:start/features/categories/presentation/providers/categories_provider.dart';
import 'package:start/features/categories/presentation/widgets/home_category_widget.dart';

class HomeCategoriesListWidget extends StatefulWidget {
  const HomeCategoriesListWidget({super.key});

  @override
  State<HomeCategoriesListWidget> createState() =>
      _HomeCategoriesListWidgetState();
}

class _HomeCategoriesListWidgetState extends State<HomeCategoriesListWidget> {
  int selectedIndex = 0;
  final categoriesProvider = Constants.globalContext()
      .watch<CategoriesProvider>();

  @override
  void initState() {
    super.initState();

    categoriesProvider.categories.insert(0, Category(id: 0, name: 'الكل'));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categoriesProvider.categories.length, (index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: HomeCategoryWidget(
              label: categoriesProvider.categories[index].name,
              isSelected: isSelected,
              onTap: () => setState(() {
                selectedIndex = index;
              }),
            ),
          );
        }),
      ),
    );
  }
}
