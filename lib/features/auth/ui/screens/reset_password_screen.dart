import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/cubit/base_cubit.dart';
import 'package:medlife_v2/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/components.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 73.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  child: Image.asset("assets/images/splsh logo.png"),),
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
                        color: const Color(0xff1A1A1A).withOpacity(0.6),)
                    .copyWith(
                  letterSpacing: -0.41,
                ),
              ),
              SizedBox(
                height: 37.h,
              ),
              DefaultFormField(
                  controller: ResetPasswordCubit.get(context).emailController,
                  type: TextInputType.emailAddress,
                  validate: (value) => BaseCubit.validateForEmail(value),
                  label: "Email",),
              SizedBox(
                height: 31.h,
              ),
              DefaultTextButton(
                function: () {
                  ResetPasswordCubit.get(context).resetPassword(
                      ResetPasswordCubit.get(context).emailController.text,
                      context,);
                  // Navigator.pushNamed(context, Routes.enterCode);
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
