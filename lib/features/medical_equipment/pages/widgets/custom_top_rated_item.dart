import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medlife_v2/ui/resources/text_styles.dart';

class CustomTopRatedItem extends StatelessWidget {
  const CustomTopRatedItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(
              color: const Color(0xff2E3A58).withOpacity(0.2), width: 3.w,),),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.favorite_border,
                size: 11,
              ),
            ),
            Image.asset("assets/images/Frame 69.png"),
            SizedBox(
              height: 7.h,
            ),
            Text(
              "Compression device",
              style: openSans10W400(color: Colors.black),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/star.png"),
                SizedBox(
                  width: 2.w,
                ),
                Image.asset("assets/images/star.png"),
                SizedBox(
                  width: 2.w,
                ),
                Image.asset("assets/images/star.png"),
                SizedBox(
                  width: 2.w,
                ),
                Image.asset("assets/images/star.png"),
                SizedBox(
                  width: 2.w,
                ),
                Image.asset("assets/images/star.png"),
              ],
            ),
            SizedBox(
              height: 2.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 15.w,
                ),
                const Text("9.98 \$"),
                CircleAvatar(
                    radius: 8.5.r,
                    backgroundColor: const Color(0xff22C7B6),
                    child: const Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 8,
                    ),),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
