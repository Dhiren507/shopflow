import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.greyDotColor,
    );
  }
}
