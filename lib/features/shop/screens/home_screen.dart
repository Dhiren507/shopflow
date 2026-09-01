import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/widgets/common_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String _selectedFilterOption = 'All';
    return Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.offGreyColor, width: 1),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Text(AppStrings.allowedFilterOptions[index]),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: AppStrings.allowedFilterOptions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
