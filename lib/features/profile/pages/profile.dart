import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/config/utils/text_styles.dart';
import 'package:medlife_v2/features/home/cubit/home_cubit.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_cubit.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_states.dart';
import 'package:medlife_v2/routes/routes.dart';
import '../../../config/utils/components.dart';
import 'widgets/custom_countainer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageIndicatorCubit, PageIndicatorState>(
      builder: (context, state) => Padding(
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
                      PageIndicatorCubit.get(context).logout();
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                    icon: Icons.logout_outlined,
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomProfileContainer(
                text: "ID Number",
                controller: HomeCubit.get(context).idController,
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
                        controller: HomeCubit.get(context).firstNameController,
                        textInputType: TextInputType.name,
                      )),
                  SizedBox(
                    width: 26.h,
                  ),
                  SizedBox(
                    width: 186.w,
                    child: CustomProfileContainer(
                      text: "Second Name",
                      controller: HomeCubit.get(context).secondNameController,
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
                  controller: HomeCubit.get(context).idController,
                  textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 21.h,
              ),
              CustomProfileContainer(
                text: "Date of birth",
                controller: HomeCubit.get(context).idController,
                textInputType: TextInputType.datetime,
              ),
              SizedBox(
                height: 21.h,
              ),
              CustomProfileContainer(
                text: "Address*",
                controller: HomeCubit.get(context).idController,
                textInputType: TextInputType.streetAddress,
              ),
              SizedBox(
                height: 21.h,
              ),
              CustomProfileContainer(
                text: "Company insurance name",
                controller: HomeCubit.get(context).idController,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 39.h,
              ),
              DefaultTextButton(function: () {}, text: "Save changes")
            ],
          ),
        ),
      ),
    );
  }
}
