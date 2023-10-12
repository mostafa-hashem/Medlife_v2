import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/auth/cubit/auth_cubit.dart';
import 'package:medlife_v2/features/auth/cubit/auth_state.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/features/profile/ui/widgets/custom_container.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_button.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state is LoggedOut){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Successfully logout",
                style: TextStyle(fontSize: 15),
              ),
              backgroundColor: AppColors.primary,
              duration: Duration(seconds: 3),
            ),
          );
        } else if (state is AuthLoading) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "Profile",
                    style: openSans16W500(color: const Color(0xff1E1E1E)),
                  ),
                  SizedBox(
                    width: 135.h,
                  ),
                  DefaultButton(
                    width: 40,
                    height: 50,
                    function: () {
                      AuthCubit.get(context).logout();
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                    icon: Icons.logout_outlined,
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomProfileContainer(
                labelText: "ID Number",
                containerText: ProfileCubit.get(context).user.idNumber!,
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 21.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 186.w,
                    child: CustomProfileContainer(
                      containerText: ProfileCubit.get(context).user.firstName!,
                      labelText: "First Name",
                      textInputType: TextInputType.name,
                    ),
                  ),
                  SizedBox(
                    width: 26.h,
                  ),
                  SizedBox(
                    width: 186.w,
                    child: CustomProfileContainer(
                      labelText: "Last Name",
                      containerText: ProfileCubit.get(context).user.lastName!,
                      textInputType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21.h,
              ),
              CustomProfileContainer(
                labelText: "Email",
                containerText: ProfileCubit.get(context).user.email!,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 21.h,
              ),
              CustomProfileContainer(
                labelText: "Date of birth",
                containerText: ProfileCubit.get(context).user.idNumber!,
                textInputType: TextInputType.datetime,
              ),
              SizedBox(
                height: 21.h,
              ),
              CustomProfileContainer(
                labelText: "Address*",
                containerText: ProfileCubit.get(context).user.idNumber!,
                textInputType: TextInputType.streetAddress,
              ),
              SizedBox(
                height: 21.h,
              ),
              CustomProfileContainer(
                labelText: "Company insurance name",
                containerText: ProfileCubit.get(context).user.idNumber!,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 39.h,
              ),
              DefaultTextButton(function: () {}, text: "Save changes"),
            ],
          ),
        ),
      ),
    );
  }
}
