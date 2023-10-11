import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/custom_view_item.dart';
import 'package:medlife_v2/route_manager.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          mainAxisExtent: 250.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 164.w,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.pushNamed(context, Routes.productDetails),
          child: const CustomViewItem(),
        ),
      ),
    );
  }
}
