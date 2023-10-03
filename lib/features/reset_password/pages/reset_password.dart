import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/utils/app_colors.dart';
import '../../../config/utils/components.dart';
import '../../../config/utils/text_styles.dart';
import '../../../routes/routes.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 73.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/splsh logo.png")),
              SizedBox(
                height: 70.h,
              ),
              Text(
                "Reset Password",
                style: openSans24W600(color: AppColors.primary),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "please enter your mail address to resets your password",
                style: openSans16W400(
                        color: const Color(0xff1A1A1A).withOpacity(0.6))
                    .copyWith(
                  letterSpacing: -0.41,
                ),
              ),
              SizedBox(
                height: 37.h,
              ),
              DefaultFormField(
                  controller: textEditingController,
                  type: TextInputType.emailAddress,
                  validate: (p0) => null,
                  label: "User Email"),
              SizedBox(
                height: 31.h,
              ),
              DefaultTextButton(
                function: () {
                  Navigator.pushNamed(context, Routes.enterCode);
                },
                text: "Send",
                textStyle: openSans14W500(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
