import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/utils/app_colors.dart';
import '../../../config/utils/components.dart';
import '../../../config/utils/text_styles.dart';
import '../../../cubit/base_cubit.dart';
import '../../../routes/routes.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 73.h),
            child: Form(
              key: LoginCubit.get(context).formKey,
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
                    "Login",
                    style: openSans24W600(color: AppColors.primary),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  DefaultFormField(
                      isPassword: false,
                      controller: LoginCubit.get(context).emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) => BaseCubit.validateForEmail(value),
                      label: "E-mail"),
                  SizedBox(
                    height: 32.h,
                  ),
                  DefaultFormField(
                      suffix: LoginCubit.get(context).isVisible ? Icons.visibility : Icons.visibility_off,
                      suffixPressed: ()=> LoginCubit.get(context).emitPasswordVisibility(!LoginCubit.get(context).isVisible),
                      isPassword: LoginCubit.get(context).isVisible,
                      controller: LoginCubit.get(context).passwordController,
                      type: TextInputType.text,
                      validate: (value) =>
                          BaseCubit.validate(value, "Please enter password"),
                      label: "Password"),
                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.resetPassword),
                    child: Row(
                      children: [
                        const Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Text(
                          "Forget password",
                          // style: openSans12W400(color: AppColors.textBlack),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  DefaultTextButton(
                    function: () {
                      if (LoginCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        LoginCubit.get(context).login(
                            email: LoginCubit.get(context).emailController.text,
                            password:
                                LoginCubit.get(context).passwordController.text,
                            context: context);
                      }
                    },
                    text: "Login",
                    textStyle: openSans14W500(color: Colors.white),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an Account?",
                          style: openSans12W400(color: Colors.black)),
                      SizedBox(
                        width: 2.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.signUp);
                          },
                          child: Text(
                            "Create Account",
                            style:
                                openSans12W400(color: const Color(0xFF22C7B6)),
                          )),
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
                          "assets/images/flat-color-icons_google.png")),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have account",
                          style: openSans12W400(color: Colors.black)),
                      SizedBox(
                        width: 2.w,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            "login",
                            style:
                                openSans12W400(color: const Color(0xFF22C7B6)),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
