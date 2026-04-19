import 'package:flutter/material.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/models/drop_down_class.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/core/widgets/list_text_field_widget.dart';

class DropdownSearchWidget extends StatelessWidget {
  const DropdownSearchWidget({
    super.key,
    required this.dropPaginationSearchDownClass,
  });

  final DropPaginationSearchDownClass dropPaginationSearchDownClass;
  @override
  Widget build(BuildContext context) {
    return ListTextFieldWidget(
      inputs: [
        TextFieldModel(
          key: 'search',
          controller: dropPaginationSearchDownClass.searchText,
          prefix: Icon(Icons.search, color: context.colors.primary),
          onChange: dropPaginationSearchDownClass.onChange,
        ),
      ],
    );
  }
}
