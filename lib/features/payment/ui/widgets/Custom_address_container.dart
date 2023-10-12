import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_address_row.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class CustomAddressContainer extends StatelessWidget {
  const CustomAddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(5.r)),
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
            text:
                "${ProfileCubit.get(context).user.firstName} ${ProfileCubit.get(context).user.lastName}",
          ),
          SizedBox(
            height: 7.h,
          ),
          CustomAddressRow(
            icon: Icons.location_on_outlined,
            text:
                "${ProfileCubit.get(context).user.firstName} ${ProfileCubit.get(context).user.lastName}",
          ),
        ],
      ),
    );
  }
}
