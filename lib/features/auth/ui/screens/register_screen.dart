import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/auth/cubit/auth_cubit.dart';
import 'package:medlife_v2/features/auth/cubit/auth_state.dart';
import 'package:medlife_v2/features/auth/data/models/register_data.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/features/profile/cubit/profile_state.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_form_filed.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/utils/helper_methods.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
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
                  validate: validateEmail,
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
                        validate: (value) =>
                            validateGeneral(value, 'First Name'),
                        label: "First Name",
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 170,
                      child: DefaultFormField(
                        controller: secondNameController,
                        type: TextInputType.name,
                        validate: (value) =>
                            validateGeneral(value, 'Second Name'),
                        label: "Second Name",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                DefaultFormField(
                  suffix: authCubit.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  isPassword: authCubit.isPasswordVisible,
                  suffixPressed: () => authCubit.emitPasswordVisibilityLogin(
                    !authCubit.isPasswordVisible,
                  ),
                  controller: passwordController,
                  type: TextInputType.text,
                  validate: validatePassword,
                  label: "Password",
                ),
                SizedBox(
                  height: 32.h,
                ),
                DefaultFormField(
                  suffix: authCubit.isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  isPassword: authCubit.isConfirmPasswordVisible,
                  suffixPressed: () =>
                      authCubit.emitPasswordConfirmVisibilitySignup(
                    !authCubit.isConfirmPasswordVisible,
                  ),
                  controller: confirmPasswordController,
                  type: TextInputType.text,
                  validate: validatePassword,
                  label: "Confirm Password",
                ),
                SizedBox(
                  height: 18.h,
                ),
                MultiBlocListener(
                  listeners: [
                    BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          ProfileCubit.get(context).getUser();
                        }
                      },
                    ),
                    BlocListener<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state is GetUserSuccess) {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.layout,
                          );
                        }
                      },
                    ),
                  ],
                  child: DefaultTextButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        authCubit.register(
                          RegisterData(
                            email: emailController.text,
                            password: passwordController.text,
                            firstName: firstNameController.text,
                            lastName: secondNameController.text,
                          ),
                        );
                      }
                    },
                    text: "Create account",
                    textStyle: openSans14W500(color: Colors.white),
                  ),
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
  }
}
