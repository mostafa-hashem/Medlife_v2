import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_address_row.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/features/profile/cubit/profile_state.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

class CustomAddressContainer extends StatelessWidget {
  const CustomAddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (_, state) {
        if (state is UpdateUserSuccess) {
          ProfileCubit.get(context).getUser();
        }
      },
      builder: (_, state) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.address),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Column(
              children: [
                CustomAddressRow(
                  icon: Icons.person_2_outlined,
                  text:
                      "${ProfileCubit.get(context).user.firstName} ${ProfileCubit.get(context).user.lastName}",
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomAddressRow(
                  icon: Icons.call_outlined,
                  text: "${ProfileCubit.get(context).user.phoneNumber}",
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomAddressRow(
                  icon: Icons.location_on_outlined,
                  text:
                      ProfileCubit.get(context).user.address?.addressDetails ??
                          '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
