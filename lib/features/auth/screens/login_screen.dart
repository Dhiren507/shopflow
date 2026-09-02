import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/common_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 20),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.maxFinite,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withAlpha(8),
                  blurRadius: 24,
                  spreadRadius: 0,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset(AppImages.loginTopLogo),
                  Text(
                    AppStrings.appName,
                    style: AppTextStyles.coloredDisplayTextMedium,
                  ),
                  const SizedBox(height: 10),
                  Text('Welcome Back', style: AppTextStyles.bodyMedium),
                  const SizedBox(height: 20),

                  CommonInputField(
                    hasLabelPadding: true,
                    labelText: 'Username',
                    hintText: 'Enter your Username',
                    leadingIcon: Icon(
                      Icons.person_2_outlined,
                      color: AppColors.greyColor,
                    ),
                  ),

                  const SizedBox(height: 20),

                  CommonInputField(
                    hasLabelPadding: true,
                    isPasswordField: _isPasswordVisible,
                    labelText: 'Password',
                    hintText: 'Enter your Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.greyColor,
                      ),
                    ),
                    leadingIcon: Icon(Icons.lock, color: AppColors.greyColor),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.lightRedBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: AppColors.errorColor),
                        const SizedBox(width: 5),
                        Text(
                          'Invalid Credentials',
                          style: AppTextStyles.errorText,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.homeScreen,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.coloredText,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              'Log In',
                              style: AppTextStyles.buttonTextMedium,
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.mainScreen,
                      );
                    },
                    child: Text(
                      'Use demo account',
                      style: AppTextStyles.coloredBodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
