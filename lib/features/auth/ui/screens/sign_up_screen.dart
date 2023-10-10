import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/cubit/base_cubit.dart';
import 'package:medlife_v2/features/auth/cubit/auth_cubit.dart';
import 'package:medlife_v2/features/auth/cubit/auth_state.dart';
import 'package:medlife_v2/features/auth/data/models/register_data.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_form_filed.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondCameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signUp = AuthCubit.get(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 73.h),
            child: Form(
              key: formKey,
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
                      controller: emailController,
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
                            controller: firstNameController,
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
                            controller: secondCameController,
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
                      suffixPressed: () => signUp.emitPasswordVisibilityLogin(
                        !signUp.isPasswordVisible,
                      ),
                      controller: passwordController,
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
                      suffixPressed: () =>
                          signUp.emitPasswordConfirmVisibilitySignup(
                        !signUp.isConfirmPasswordVisible,
                      ),
                      controller: confirmPasswordController,
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
                        if (formKey.currentState!.validate()) {
                          signUp.register(
                            RegisterData(
                              email: emailController.text,
                              password: passwordController.text,
                              firstName: firstNameController.text,
                              lastName: secondCameController.text,
                            ),
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
