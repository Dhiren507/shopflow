import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/providers/auth_provider.dart';
import 'package:shopflow/core/utils/validators.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/core/widgets/common_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = true;

  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 20),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.maxFinite,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
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
                    style: AppTextStyles.headingLarge.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppStrings.greetingText,
                    style: AppTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: 20),

                  Form(
                    key: _loginFormKey,
                    autovalidateMode: .onUnfocus,
                    child: Column(
                      children: [
                        CommonInputField(
                          hasLabelPadding: true,
                          labelText: AppStrings.usernameText,
                          hintText: AppStrings.usernameHintText,
                          leadingIcon: Icon(
                            Icons.person_2_outlined,
                            color: AppColors.border,
                          ),
                          controller: _emailController,
                          validator: Validators.validateEmail,
                        ),

                        const SizedBox(height: 20),

                        CommonInputField(
                          controller: _passwordController,
                          validator: Validators.validatePassword,
                          hasLabelPadding: true,
                          isPasswordField: _isPasswordVisible,
                          labelText: AppStrings.passwordText,
                          hintText: AppStrings.passwordHintText,
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
                              color: AppColors.border,
                            ),
                          ),
                          leadingIcon: Icon(
                            Icons.lock,
                            color: AppColors.border,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.errorBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: AppColors.errorText),
                        const SizedBox(width: 5),
                        Text(
                          AppStrings.loginErrorText,
                          style: AppTextStyles.errorText,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  CommonButton(
                    label: AppStrings.loginButtonText,
                    onPressed: () async {
                      bool isSuccess = await context.read<AuthProvider>().login(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                      if (isSuccess) {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.mainScreen,
                        );
                      }
                    },
                    trailingIcon: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.white,
                      size: 20,
                    ),
                    isLoading: authProvider.isLoading,
                  ),

                  TextButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.mainScreen,
                      );
                    },
                    child: Text(
                      AppStrings.helperText,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                      ),
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
