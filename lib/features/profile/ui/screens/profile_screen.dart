import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/auth/cubit/auth_cubit.dart';
import 'package:medlife_v2/features/profile/ui/widgets/custom_container.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_button.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final idNumberController = TextEditingController();
  final companyInsuranceNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final addressController = TextEditingController();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              text: "ID Number",
              controller: idNumberController,
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
                    text: "First Name",
                    controller: firstNameController,
                    textInputType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  width: 26.h,
                ),
                SizedBox(
                  width: 186.w,
                  child: CustomProfileContainer(
                    text: "Second Name",
                    controller: secondNameController,
                    textInputType: TextInputType.name,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            CustomProfileContainer(
              text: "Email",
              controller: emailController,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 21.h,
            ),
            CustomProfileContainer(
              text: "Date of birth",
              controller: dateOfBirthController,
              textInputType: TextInputType.datetime,
            ),
            SizedBox(
              height: 21.h,
            ),
            CustomProfileContainer(
              text: "Address*",
              controller: addressController,
              textInputType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 21.h,
            ),
            CustomProfileContainer(
              text: "Company insurance name",
              controller: companyInsuranceNameController,
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: 39.h,
            ),
            DefaultTextButton(function: () {}, text: "Save changes"),
          ],
        ),
      ),
    );
  }
}
