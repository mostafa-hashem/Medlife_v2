import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medlife_v2/ui/resources/app_colors.dart';

class DefaultButton extends StatelessWidget {
  final double? width;
  final double height;
  final Color? background;
  final TextStyle textStyle;
  final bool isUpperCase;
  final double radius;
  final Function function;
  final String? text;
  final IconData icon;
  final Color? iconColor;
  final Color? borderColor;
  final double? iconSize;

  const DefaultButton(
      {super.key,
      this.width,
      this.height = 40,
      this.background,
      this.textStyle = const TextStyle(
        color: Colors.white,
      ),
      this.isUpperCase = true,
      this.radius = 8,
      required this.function,
      this.text,
      this.iconColor,
      this.borderColor,
      this.iconSize,
      required this.icon,});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: width ?? constraints.maxWidth,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor ?? Colors.transparent),
            color: background ?? AppColors.primary,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: GestureDetector(
            onTap: function as void Function()?,
            child: Center(
                child: Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: iconSize,
            ),),
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
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;

  const DefaultTextButton({
    super.key,
    required this.function,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.textStyle = const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.41,
        height: 0.09,),
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: width ?? 345.w,
        height: height ?? 56.h,
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.primary,
            borderRadius: BorderRadius.circular(7.r),
            border: Border.all(color: borderColor ?? Colors.transparent),),
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
  final bool? isPassword;
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
    this.isPassword,
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
      obscureText: isPassword ?? false,
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
            borderRadius: BorderRadius.circular(7.r),),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
            borderRadius: BorderRadius.circular(7.r),),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
            borderRadius: BorderRadius.circular(7.r),),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: Colors.transparent),),
      child: TextField(
        onChanged: (value) {},
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: const Color(0xff000000).withOpacity(0.5),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          hintText: 'What are looking for',
          hintStyle: TextStyle(
              color: const Color(0xff000000).withOpacity(0.5),
              letterSpacing: -1,
              fontSize: 12.sp,),
          suffixIcon: Icon(
            Icons.search,
            color: const Color(0xff000000).withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}