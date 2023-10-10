import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/payment_method/cubit/payment_method_cubit.dart';
import 'package:medlife_v2/features/payment_method/pages/widgets/payment_card.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 68.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 17.w,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 44.w,
                    height: 42.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.76.r),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x23EA6A58),
                          blurRadius: 20,
                          offset: Offset(0, 4.41),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 75.w),
                Text(
                  'Payment method',
                  style: openSans16W500(color: const Color(0xff1E1E1E)),
                ),
              ],
            ),
            SizedBox(
              height: 66.h,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.insurancePayment),
                child: GridView.builder(
                    itemCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14.w,
                    ),
                    itemBuilder: (context, index) {
                      return PaymentCard(
                        image: PaymentMethodCubit.get(context)
                            .paymentImages[index],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
