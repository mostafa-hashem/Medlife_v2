import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class DefaultButton extends StatelessWidget {
  final double? width;
  final double height;
  final Color background;
  final TextStyle textStyle;
  final bool isUpperCase;
  final double radius;
  final Function function;
  final String? text;
  final IconData icon;

  const DefaultButton(
      {super.key,
      this.width,
      this.height = 40,
      this.background = AppColors.primary,
      this.textStyle = const TextStyle(
        color: Colors.white,
      ),
      this.isUpperCase = true,
      this.radius = 8,
      required this.function,
      this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: width ?? constraints.maxWidth,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: GestureDetector(
            onTap: function as void Function()?,
            child: Center(child: Icon(icon, color: Colors.white,)),
          ),
        );
      },
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  final Function function;
  final String text;
  final TextStyle textStyle;

  const DefaultTextButton({
    super.key,
    required this.function,
    this.textStyle = const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.41,
        height: 0.09),
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 345.w,
        height: 56.h,
        decoration: BoxDecoration(
            color: const Color(0xff22C7B6),
            borderRadius: BorderRadius.circular(7.r)),
        child: TextButton(
          onPressed: function as void Function()?,
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
          ),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final String label;
  final IconData? suffix;
  final void Function()? suffixPressed;
  final bool isClickable;

  const DefaultFormField({
    super.key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    required this.validate,
    required this.label,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      textInputAction: TextInputAction.next,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        labelText: label,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                  color: AppColors.primary,
                ),
              )
            : null,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
            borderRadius: BorderRadius.circular(7.r)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
            borderRadius: BorderRadius.circular(7.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
            borderRadius: BorderRadius.circular(7.r)),
      ),
    );
  }
}
