import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class CommonExpansionTile extends StatelessWidget {
  final String headerTitle;
  final List<Widget>? inputFields;
  const CommonExpansionTile({
    super.key,
    required this.headerTitle,
    required this.inputFields,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      shape: const Border(),
      minTileHeight: 10,
      title: Text(
        headerTitle,
          style : AppTextStyles.headingMedium
      ),

      children: [
        Column(
          crossAxisAlignment: .start,
          spacing: 5,
          children: [...?inputFields],
        ),
      ],
    );
  }
}
