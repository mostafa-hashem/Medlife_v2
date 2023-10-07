import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/components.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class CustomProfileContainer extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String text;

  const CustomProfileContainer({
    required this.controller,
    required this.text,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              openSans14W400(color: const Color(0xff1E1E1E).withOpacity(0.5)),
        ),
        SizedBox(
          height: 8.h,
        ),
        DefaultFormField(
          isClickable: false,
          controller: controller,
          type: textInputType,
          validate: (p0) => null,
          label: '',
        ),
      ],
    );
  }
}
