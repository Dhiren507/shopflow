import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/services/image_picker_service.dart';
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
        await ImagePickerService.pickImageFromGallery();

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
        const SizedBox(height: 15),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                final option = ProfileConstants.profileOptions[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(color: AppColors.bgStepper),
                          child: SvgPicture.asset(option['leadingIcon']),
                        ),
                        Text(
                          option['optionText'],
                          style: AppTextStyles.headingMedium,
                        ),
                        const Spacer(),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: ProfileConstants.profileOptions.length,
            ),
          ),
        ),
        CommonDivider(height: 50),
        const Spacer(),

        CommonButton(
          label: 'Log Out',
          onPressed: () {},
          leadingIcon: Icon(Icons.logout_outlined),
          backgroundColor: AppColors.errorBg,
          textColor: AppColors.darkRed,
        ),
      ],
    );
  }
}
