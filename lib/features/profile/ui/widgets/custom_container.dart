import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class CustomProfileContainer extends StatelessWidget {
  final TextInputType textInputType;
  final String labelText;
  final String containerText;

  const CustomProfileContainer({
    required this.labelText,
    required this.containerText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style:
              openSans14W400(color: const Color(0xff1E1E1E).withOpacity(0.5)),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          height: 46.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor, width: 2.w),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(containerText),),
          ),
        ),
        // TextFormField(
        //   textInputAction: TextInputAction.next,
        //   decoration: InputDecoration(
        //     contentPadding: const EdgeInsets.all(12),
        //     border: OutlineInputBorder(
        //       borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
        //       borderRadius: BorderRadius.circular(7.r),
        //     ),
        //     enabledBorder: OutlineInputBorder(
        //       borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
        //       borderRadius: BorderRadius.circular(7.r),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
        //       borderRadius: BorderRadius.circular(7.r),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
