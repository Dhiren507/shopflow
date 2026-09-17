import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class NumericStepperButton extends StatelessWidget {
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final int value;
  final bool isSmall;

  const NumericStepperButton({
    super.key,
    required this.onDecrement,
    required this.onIncrement,
    required this.value,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgStepper,
        border: isSmall
            ? Border.all(color: Colors.transparent)
            : Border.all(color: AppColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onDecrement,
            iconSize: isSmall ? 16 : 24,
            constraints: isSmall ? const BoxConstraints() : null,
            padding: isSmall
                ? const EdgeInsets.all(0)
                : const EdgeInsets.all(8),
            icon: const Icon(Icons.remove),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmall ? 1.0 : 12.0),
            child: Text(
              '$value',
              style: isSmall
                  ? AppTextStyles.bodySmall
                  : AppTextStyles.headingSmall.copyWith(
                      color: AppColors.black,
                    ),
            ),
          ),
          IconButton(
            onPressed: onIncrement,
            iconSize: isSmall ? 16 : 24,
            constraints: isSmall ? const BoxConstraints() : null,
            padding: isSmall
                ? const EdgeInsets.all(0)
                : const EdgeInsets.all(8),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
