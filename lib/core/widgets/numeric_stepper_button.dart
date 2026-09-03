import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class NumericStepperButton extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final bool isSmall;
  final int value;

  const NumericStepperButton({
    super.key,
    required this.onChanged,
    required this.value,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.stepperBgColor,
        border: Border.all(
          color: AppColors.greyColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(isSmall ? 24 : 24)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              if (value > 1) {
                onChanged(value - 1);
              }
            },
            iconSize: isSmall ? 16 : 24,
            constraints: isSmall ? const BoxConstraints() : null,
            padding: isSmall ? const EdgeInsets.all(4) : const EdgeInsets.all(8),
            visualDensity: isSmall ? VisualDensity.compact : null,
            icon: const Icon(Icons.remove),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmall ? 2.0 : 8.0),
            child: Text(
              '$value',
              style: isSmall ? AppTextStyles.bodySmall : AppTextStyles.buttonTextMediumBlack,
            ),
          ),
          IconButton(
            onPressed: () {
              onChanged(value + 1);
            },
            iconSize: isSmall ? 16 : 24,
            constraints: isSmall ? const BoxConstraints() : null,
            padding: isSmall ? const EdgeInsets.all(4) : const EdgeInsets.all(8),
            visualDensity: isSmall ? VisualDensity.compact : null,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
