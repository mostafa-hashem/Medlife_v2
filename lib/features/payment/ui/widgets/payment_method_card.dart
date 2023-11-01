import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class PaymentMethodCard extends StatelessWidget {
  final String image;
  final String? text;
  final Color? color;

  const PaymentMethodCard({super.key, required this.image, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 8.w),
        child: Row(
          children: [
            Container(
                constraints: BoxConstraints(
                  // minHeight: 50.h,
              maxWidth: 50.w,
                ),
                child: Image.asset(image),),
            if (text != null)
              SizedBox(
                width: 14.w,
              ),
            if (text != null)
              Text(
                text ?? "",
                style: openSans18W500(color: Colors.black),
              ),
            const Spacer(),
             Icon(color != null ? Icons.circle : Icons.circle_outlined, color: color,),
          ],
        ),
      ),
    );
  }
}
