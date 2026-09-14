import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? textColor;
  final bool centerTitle;

  const CommonAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.textColor,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgScreen,
      scrolledUnderElevation: 0,
      title: Text(
        title ?? AppStrings.appName,
        style: AppTextStyles.headingLarge.copyWith(
          color: textColor ?? AppColors.primary,
        ),
      ),
      centerTitle: centerTitle,
      leading:
          leading ?? IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      actions:
          actions ??
          [IconButton(onPressed: () {}, icon: Icon(Icons.tune_outlined))],
      iconTheme: IconThemeData(color: textColor ?? AppColors.textHint),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
