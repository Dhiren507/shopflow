import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class CommonInputField extends StatelessWidget {
  final String? labelText;
  final Widget? labelTrailing;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final bool hasLabelPadding;
  final TextEditingController? controller;
  final String? hintText;
  final bool isMultiline;
  final int? maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final AutovalidateMode? autovalidateMode;
  final bool? isPasswordField;
  final ValueChanged? onChanged;

  const CommonInputField({
    super.key,
    this.labelText,
    this.labelTrailing,
    this.hasLabelPadding = true,
    this.controller,
    this.hintText,
    this.isMultiline = false,
    this.maxLines,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onTap,
    this.autovalidateMode,
    this.leadingIcon,
    this.isPasswordField,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: hasLabelPadding
              ? const EdgeInsets.only(left: 8)
              : EdgeInsets.zero,
          child: Row(
            children: [
              Text(labelText ?? '', style: AppTextStyles.inputLabel),
              ?labelTrailing,
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          onChanged: onChanged,
          obscureText: isPasswordField ?? false,
          controller: controller,
          validator: validator,
          inputFormatters: inputFormatters,
          onTap: onTap,
          autovalidateMode: autovalidateMode,
          maxLines: (isMultiline ? (maxLines ?? 4) : 1),
          keyboardType: (isMultiline
              ? TextInputType.multiline
              : (keyboardType ?? TextInputType.text)),
          decoration: InputDecoration(
            prefixIcon: leadingIcon,
            filled: true,
            fillColor: AppColors.bgCard,
            hintText: hintText,
            hintStyle: AppTextStyles.hintText,
            suffixIcon: suffixIcon,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColors.border, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColors.border, width: 2),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColors.errorText),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColors.errorText),
            ),
          ),
        ),
      ],
    );
  }
}
