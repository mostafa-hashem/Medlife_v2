import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/blood_banks/cubit/blood_banks_cubit.dart';
import 'package:medlife_v2/features/blood_banks/ui/widgets/blood_banks_product_item.dart';
import 'package:medlife_v2/route_manager.dart';

class BloodBanksProductsList extends StatelessWidget {
  const BloodBanksProductsList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.3,
          crossAxisSpacing: 12.w,
          childAspectRatio: 164.w,
        ),
        itemBuilder: (context, index) {
          final bloodBanks = BloodBanksCubit.get(context).bloodBanks[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.bloodBankDetails,
                arguments: bloodBanks,
              );
            },
            child: BloodBanksProductItem(bloodBanks),
          );
        },
        itemCount: BloodBanksCubit.get(context).bloodBanks.length,
      ),
    );
  }
}
