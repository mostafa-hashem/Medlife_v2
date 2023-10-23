import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/cart/ui/widgets/custom_divider.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_address_container.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_app_bar.dart';
import 'package:medlife_v2/features/payment/ui/widgets/payment_method_card.dart';
import 'package:medlife_v2/features/payment/ui/widgets/shipping_method_row.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/ui/widgets/summery_row.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 43.h,
                ),
                const CustomAppBar(text: "Checkout"),
                SizedBox(
                  height: 37.h,
                ),
                Text(
                  "Shipping Address",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const CustomAddressContainer(),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Shipping Method",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                    child: const ShippingMethodRow(),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Payment Method",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const PaymentMethodCard(image: "assets/images/Mastercard.png"),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(image: "assets/images/Visa Card.png"),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(image: "assets/images/Mada.png"),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(
                  image: "assets/images/tabby_installment_mini 1.png",
                  text: 'Tabby',
                ),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(
                  image: "assets/images/tamara.png",
                  text: 'Tamara',
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Order Summery",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 9.h,
                ),
                const SummeryRow(text: 'Compression device', price: '5 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Delivery Fee', price: '5 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Discount', price: '5 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Shipping', price: '2 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Taxes', price: '1.5 SAR'),
                SizedBox(
                  height: 16.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 16.h,
                ),
                const SummeryRow(text: 'Total', price: '18.5 SAR'),
                SizedBox(
                  height: 48.h,
                ),
                DefaultTextButton(
                  function: () =>
                      Navigator.pushNamed(context, Routes.successfulPayment),
                  text: "Check out",
                  textStyle: openSans16W500(color: Colors.white),
                  height: 65.h,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 48.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
