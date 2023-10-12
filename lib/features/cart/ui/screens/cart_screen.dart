import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/cart/ui/widgets/cart_item.dart';
import 'package:medlife_v2/features/cart/ui/widgets/custom_divider.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/ui/widgets/summery_row.dart';

class CartScreen extends StatelessWidget {
  const CartScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 64.h, left: 21.w, right: 21.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Text(
              "Cart",
              style: openSans16W500(color: const Color(0xff1E1E1E)),
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 300.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => const CartItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 23.h,
                    ),
                    itemCount: 8,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          const CustomDivider(),
          SizedBox(
            height: 14.h,
          ),
          Text(
            "Order Summery",
            style: openSans14W500(color: AppColors.primary),
          ),
          SizedBox(
            height: 9.h,
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
            height: 12.h,
          ),
          const SummeryRow(text: 'Total', price: '8.5 SAR'),
          SizedBox(
            height: 24.h,
          ),
          DefaultTextButton(
            function: () => Navigator.pushNamed(context, Routes.paymentMethod),
            text: "Place order",
            textStyle: openSans16W500(color: Colors.white),
            height: 65.h,
            width: double.infinity,
          ),
          SizedBox(
            height: 24.h,
          ),
          DefaultTextButton(
            function: () {},
            text: "Download my cart",
            textStyle: openSans16W500(color: Colors.black),
            height: 65.h,
            width: double.infinity,
            backgroundColor: Colors.transparent,
            borderColor: AppColors.primary,
          ),
          SizedBox(
            height: 70.h,
          ),
        ],
      ),
    );
  }
}
