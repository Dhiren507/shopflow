import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CommonDivider extends StatelessWidget {
  final double? height;
  const CommonDivider({super.key, this.height = 1});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: 1,
      color: AppColors.divider,
    );
  }
}
