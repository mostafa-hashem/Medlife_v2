import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/utils/text_styles.dart';

class CustomViewItem extends StatelessWidget {
  const CustomViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(
            color: const Color(0xff2E3A58).withOpacity(0.2), width: 3.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.015),
            blurRadius: 3.05,
            offset: const Offset(0, 3.05),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.favorite_border,
                size: 13,
              ),
            ),
            Image.asset(
              "assets/images/Frame 69.png",
              width: 140.w,
              height: 108.h,
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              "Compression device",
              style: openSans16W400(color: Colors.black),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/star.png",
                  width: 18.w,
                  height: 18.h,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Image.asset(
                  "assets/images/star.png",
                  width: 18.w,
                  height: 18.h,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Image.asset(
                  "assets/images/star.png",
                  width: 18.w,
                  height: 18.h,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Image.asset(
                  "assets/images/star.png",
                  width: 18.w,
                  height: 18.h,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Image.asset(
                  "assets/images/star.png",
                  width: 18.w,
                  height: 18.h,
                ),
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
                Text(
                  "9.98 \$",
                  style: openSans18W500(color: const Color(0xff526262)),
                ),
                CircleAvatar(
                    radius: 15.r,
                    backgroundColor: const Color(0xff22C7B6),
                    child: const Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 18,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 5.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
