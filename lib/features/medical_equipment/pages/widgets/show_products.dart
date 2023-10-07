import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../routes/routes.dart';
import 'custom_view_item.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts({super.key});

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
              childAspectRatio: 164.w),
          itemBuilder: (context, index) => InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, Routes.productDetails),
              child: const CustomViewItem()),
        ));
  }
}
