import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class NumericStepperButton extends StatelessWidget {
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final bool isSmall;
  final int value;
  final bool isStyled;

  const NumericStepperButton({
    super.key,
    required this.onDecrement,
    required this.onIncrement,
    required this.value,
    this.isSmall = false,
    this.isStyled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isStyled ? AppColors.bgCard : AppColors.bgStepper,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.all(Radius.circular(isStyled ? 12 : 24)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              onDecrement();
            },
            iconSize: isSmall ? 16 : 24,
            constraints: isSmall ? const BoxConstraints() : null,
            padding: isSmall
                ? const EdgeInsets.all(4)
                : const EdgeInsets.all(8),
            visualDensity: isSmall ? VisualDensity.compact : null,
            icon: const Icon(Icons.remove),
          ),
          Container(
            decoration: isStyled
                ? const BoxDecoration(
                    color: AppColors.bgScreen,
                    border: Border(
                      left: BorderSide(color: AppColors.border, width: 1.0),
                      right: BorderSide(color: AppColors.border, width: 1.0),
                    ),
                  )
                : null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isSmall ? 2.0 : 12.0),
              child: Text(
                '$value',
                style: isSmall
                    ? AppTextStyles.bodySmall
                    : AppTextStyles.headingSmall.copyWith(
                        color: AppColors.black,
                      ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              onIncrement();
            },
            iconSize: isSmall ? 16 : 24,
            constraints: isSmall ? const BoxConstraints() : null,
            padding: isSmall
                ? const EdgeInsets.all(4)
                : const EdgeInsets.all(8),
            visualDensity: isSmall ? VisualDensity.compact : null,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
