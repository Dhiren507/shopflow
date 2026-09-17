import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';

class CommonProgressIndicator extends StatelessWidget {
  final Color? barColor;
  final num? value;
  final num? totalItems;
  const CommonProgressIndicator({super.key,this.value, this.barColor, this.totalItems});

  @override
  Widget build(BuildContext context) {

    final double currentProgress = (value ?? 0).toDouble();
    final double allItems = ( totalItems ?? 0).toDouble();

    double progressBarValue = 0;

    if(allItems > 0){
      progressBarValue = ( currentProgress / allItems);
    } else {
      progressBarValue = currentProgress;
    }

    return  LinearProgressIndicator(
      value: progressBarValue.clamp(0.0, 1.0),
      borderRadius: BorderRadius.circular(8),
      color: barColor ?? AppColors.primaryLight
    );
  }
}
