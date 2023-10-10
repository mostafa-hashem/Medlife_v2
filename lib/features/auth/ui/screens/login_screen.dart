import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/cubit/base_cubit.dart';
import 'package:medlife_v2/features/auth/cubit/auth_cubit.dart';
import 'package:medlife_v2/features/auth/cubit/auth_state.dart';
import 'package:medlife_v2/features/auth/data/models/login_data.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_form_filed.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final login = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is AuthSuccess){
          Navigator.pushNamed(context, Routes.home);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 73.h),
            child: Form(
              key: formKey,
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
                    "Login",
                    style: openSans24W600(color: AppColors.primary),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  DefaultFormField(
                    isPassword: false,
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (value) => BaseCubit.validateForEmail(value),
                    label: "E-mail",
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  DefaultFormField(
                    suffix: login.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixPressed: () => login.emitPasswordVisibilityLogin(
                      !login.isVisible,
                    ),
                    isPassword: login.isVisible,
                    controller: passwordController,
                    type: TextInputType.text,
                    validate: (value) =>
                        BaseCubit.validate(value, "Please enter password"),
                    label: "Password",
                  ),
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  DefaultTextButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        login.login(
                          LoginData(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
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
                      Text(
                        "Don’t have an Account?",
                        style: openSans12W400(color: Colors.black),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.signUp,
                          );
                        },
                        child: Text(
                          "Create Account",
                          style: openSans12W400(color: const Color(0xFF22C7B6)),
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
                          style: openSans12W400(color: const Color(0xFF22C7B6)),
                        ),
                      ),
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
