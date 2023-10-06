import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/utils/components.dart';
import '../../../../config/utils/text_styles.dart';

class CustomProfileContainer extends StatelessWidget {
  TextEditingController controller = TextEditingController();
   final TextInputType textInputType;
   final String text;
   CustomProfileContainer({super.key, required this.controller, required this.text,required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return  Column(
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
          controller: controller,
          type: textInputType,
          validate: (p0) => null,
          label: '',
        ),
      ],
    );
  }
}
