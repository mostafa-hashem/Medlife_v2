import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medlife_v2/ui/resources/text_styles.dart';

class CustomSealerContainer extends StatelessWidget {
  final String text;
  final String sealerName;
  final String starImage;
  final String rate;

  const CustomSealerContainer(
      {super.key,
      required this.text,
      required this.sealerName,
      required this.starImage,
      required this.rate,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          border: Border.all(width: 0.50.w, color: const Color(0x4C2E3A58)),
          borderRadius: BorderRadius.circular(5.r),),
      child: Row(
        children: [
          SizedBox(
            width: 7.w,
          ),
          Text(
            text,
            style: openSans10W400(color: Colors.black)
                .copyWith(letterSpacing: -0.21),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            sealerName,
            style: openSans10W500(color: const Color(0xff1976D2))
                .copyWith(letterSpacing: -0.41),
          ),
          SizedBox(
            width: 5.w,
          ),
          Image.asset(starImage),
          SizedBox(
            width: 5.w,
          ),
          Text(
            rate,
            style: openSans10W400(color: Colors.black)
                .copyWith(letterSpacing: -0.41),
          ),
        ],
      ),
    );
  }
}
