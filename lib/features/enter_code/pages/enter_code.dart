import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/enter_code/pages/widgets/custom_container.dart';

import '../../../config/utils/app_colors.dart';
import '../../../config/utils/text_styles.dart';


class EnterCode extends StatelessWidget {
  const EnterCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 73.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/splsh logo.png")),
              SizedBox(
                height: 70.h,
              ),
              Text(
                "Enter code",
                style: openSans24W600(color: AppColors.primary),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "We’ve sent a email with an activation code to your Email",
                style: openSans16W400(
                        color: const Color(0xff1A1A1A).withOpacity(0.8))
                    .copyWith(letterSpacing: -0.41),
              ),
              SizedBox(
                height: 37.h,
              ),
              SizedBox(
                height: 68.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 32.w,
                    ),
                    Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              const CustomContainer(),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 9.w,
                              ),
                          itemCount: 5),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 97.w),
                child: Row(
                  children: [
                    Text(
                      "Send code again",
                      style: openSans16W500(color: const Color(0xff576A69)),
                    ),
                    SizedBox(width: 8.w,),
                    Text(
                      "00:20",
                      style: openSans16W400(color: const Color(0xff576A69)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
