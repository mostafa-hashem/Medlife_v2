import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/ui/resources/commponents.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class HomeMedicalEquipmentItem extends StatelessWidget {
  const HomeMedicalEquipmentItem(this.medicalEquipment);

  final MedicalEquipment medicalEquipment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(
          color: const Color(0xff2E3A58).withOpacity(0.2),
          width: 3.w,
        ),
      ),
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
            Container(
                constraints: BoxConstraints(
                  minHeight: 85.h,
                  maxWidth: 85.w,
                  maxHeight: 85.h,
                  minWidth: 85.w,
                ),
                child: Image.network(medicalEquipment.imagesUrls.first),),
            SizedBox(
              height: 7.h,
            ),
            Text(
              medicalEquipment.title,
              style: openSans10W400(color: Colors.black),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              medicalEquipment.sellerName,
              style: openSans10W400(color: Colors.blue),
            ),
            SizedBox(
              height: 6.h,
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
                Text("${medicalEquipment.price} $currency"),
                CircleAvatar(
                  radius: 8.5.r,
                  backgroundColor: const Color(0xff22C7B6),
                  child: const Icon(
                    Icons.add_shopping_cart_outlined,
                    size: 8,
                  ),
                ),
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
