import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_app_bar.dart';
import 'package:medlife_v2/features/payment/ui/widgets/payment_card.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen();

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  List<String> paymentImages = [
    "assets/images/Cash payment.png",
    "assets/images/Insurance payment.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 68.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
           const CustomAppBar(text: 'Payment method'),
            SizedBox(
              height: 66.h,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.checkout),
                child: GridView.builder(
                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14.w,
                  ),
                  itemBuilder: (context, index) {
                    return PaymentCard(
                      image: paymentImages[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
