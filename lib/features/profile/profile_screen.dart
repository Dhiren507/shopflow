import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/providers/auth_provider.dart';
import 'package:shopflow/core/services/app_storage_service.dart';
import 'package:shopflow/core/utils/image_picker_helper.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/core/widgets/common_divider.dart';
import 'package:shopflow/features/profile/constants/profile_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _avatarImage = '';

  Future<void> _handleProfileSelection() async {
    final String? selectedImagePath =
    await pickImageFromGallery();

    if (selectedImagePath != null) {
      setState(() {
        _avatarImage = selectedImagePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentGeometry.bottomRight,
          children: [
            CircleAvatar(
              radius: 52,
              backgroundColor: AppColors.primaryDim,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _avatarImage != null
                    ? FileImage(File(_avatarImage!))
                    : null,
                child: (_avatarImage == null || _avatarImage == '')
                    ? SvgPicture.asset(AppImages.defaultAvatar, height: 60)
                    : null,
              ),
            ),
            GestureDetector(
              onTap: () {
                _handleProfileSelection();
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
                final option = ProfileConstants.profileOptions[index];
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
              itemCount: ProfileConstants.profileOptions.length,
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
