import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/cubit/base_cubit.dart';
import 'package:medlife_v2/features/sign_up/cubit/signip_cubit.dart';
import 'package:medlife_v2/features/sign_up/cubit/signup_states.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/components.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen();

  @override
  Widget build(BuildContext context) {
    final signUp = SignUpCubit.get(context);
    return BlocBuilder<SignUpCubit, SignUpStates>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 73.h),
            child: Form(
              key: SignUpCubit.get(context).formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      child: Image.asset("assets/images/splsh logo.png"),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Text(
                      "Create account",
                      style: openSans24W600(color: AppColors.primary),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    DefaultFormField(
                      controller: signUp.emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) => BaseCubit.validateForEmail(value),
                      label: "E-mail",
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 170,
                          child: DefaultFormField(
                            controller: signUp.firstNameController,
                            type: TextInputType.name,
                            validate: (value) => BaseCubit.validate(
                              value,
                              "Please enter first name",
                            ),
                            label: "First Name",
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        SizedBox(
                          width: 170,
                          child: DefaultFormField(
                            controller: signUp.secondCameController,
                            type: TextInputType.name,
                            validate: (value) => BaseCubit.validate(
                              value,
                              "Please enter second name",
                            ),
                            label: "Second Name",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    DefaultFormField(
                      suffix: signUp.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      isPassword: signUp.isPasswordVisible,
                      suffixPressed: () => signUp
                          .emitPasswordVisibility(!signUp.isPasswordVisible),
                      controller: signUp.passwordController,
                      type: TextInputType.text,
                      validate: (value) =>
                          BaseCubit.validate(value, "Please enter password"),
                      label: "Password",
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    DefaultFormField(
                      suffix: signUp.isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      isPassword: signUp.isConfirmPasswordVisible,
                      suffixPressed: () => signUp.emitPasswordConfirmVisibility(
                        !signUp.isConfirmPasswordVisible,
                      ),
                      controller: signUp.confirmPasswordController,
                      type: TextInputType.text,
                      validate: (value) => BaseCubit.validate(
                        value,
                        "Please confirm Password",
                      ),
                      label: "Confirm Password",
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    DefaultTextButton(
                      function: () {
                        if (SignUpCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          SignUpCubit.get(context).signUp(
                            context: context,
                            email:
                                SignUpCubit.get(context).emailController.text,
                            password: SignUpCubit.get(context)
                                .passwordController
                                .text,
                            firstName: SignUpCubit.get(context)
                                .firstNameController
                                .text,
                            lastName: SignUpCubit.get(context)
                                .secondCameController
                                .text,
                          );
                        }
                      },
                      text: "Create account",
                      textStyle: openSans14W500(color: Colors.white),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have account ?",
                          style: openSans12W400(color: Colors.black),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.login,
                            );
                          },
                          child: Text(
                            "login",
                            style: openSans12W400(
                              color: const Color(0xFF22C7B6),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          thickness: 2.h,
                          color: const Color(0xFF22C7B6),
                          endIndent: 13.w,
                        ),
                        Text(
                          "OR",
                          style: openSans16W500(color: Colors.black),
                        ),
                        Divider(
                          thickness: 2.h,
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/flat-color-icons_google.png",
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have account",
                          style: openSans12W400(color: Colors.black),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "login",
                            style: openSans12W400(
                              color: const Color(0xFF22C7B6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
