import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/features/tab_bar/providers/tab_bar_index_provider.dart';
import 'package:shopflow/features/auth/providers/auth_provider.dart';
import 'package:shopflow/features/profile/providers/profile_screen_provider.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/core/widgets/common_divider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<ProfileScreenProvider>(
          builder: (context, profileProvider, child) {
            final avatarImage = profileProvider.avatarImage;
            return Stack(
              alignment: AlignmentGeometry.bottomRight,
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundColor: AppColors.primaryDim,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        (avatarImage != null && avatarImage.isNotEmpty)
                        ? FileImage(File(avatarImage))
                        : null,
                    child: (avatarImage == null || avatarImage.isEmpty)
                        ? SvgPicture.asset(AppImages.defaultAvatar, height: 60)
                        : null,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    profileProvider.pickAvatarImage();
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppImages.editPencil,
                      height: 13,
                      width: 13,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 15),
        Text('Alex Morgan', style: AppTextStyles.headingMedium),
        Text('alex.morgan@example.com', style: AppTextStyles.bodySmall),
        const SizedBox(height: 5),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
              clipBehavior: .none,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final option = AppStrings.profileOptions[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, option['navigateTo']);
                  },
                  child: Card(
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.bgStepper,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              option['leadingIcon'],
                              height: 16,
                              width: 16,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            option['optionText'],
                            style: AppTextStyles.headingMedium,
                          ),
                          const Spacer(),
                          Icon(Icons.navigate_next, color: AppColors.textHint),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: AppStrings.profileOptions.length,
            ),
          ),
        ),

        Column(
          children: [
            CommonDivider(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: CommonButton(
                label: AppStrings.logOutButtonText,
                onPressed: () async {
                  await context.read<AuthProvider>().logout();
                  if (!context.mounted) return;
                  context.read<TabBarIndexProvider>().setCurrentTabIndex(0);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.loginScreen,
                    (route) => false,
                  );
                },
                leadingIcon: Icon(
                  Icons.logout_outlined,
                  color: AppColors.darkRed,
                  size: 20,
                ),
                backgroundColor: AppColors.errorBg,
                textColor: AppColors.darkRed,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
