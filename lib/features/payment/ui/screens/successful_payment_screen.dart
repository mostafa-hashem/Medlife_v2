import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/cart/cubit/cart_cubit.dart';
import 'package:medlife_v2/features/cart/ui/widgets/custom_divider.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_app_bar.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/commponents.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/summery_row.dart';
import 'package:medlife_v2/utils/helper_methods.dart';

class SuccessfulPaymentScreen extends StatefulWidget {
  const SuccessfulPaymentScreen();

  @override
  State<SuccessfulPaymentScreen> createState() =>
      _SuccessfulPaymentScreenState();
}

class _SuccessfulPaymentScreenState extends State<SuccessfulPaymentScreen> {
  List<double> summery = [
    2,
    -90,
    5,
    1.5,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(text: "Successful payment"),
                SizedBox(
                  height: 24.h,
                ),
                Image.asset("assets/images/Congratulations.png"),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  """
You successfully made a payment,
enjoy our service! you will receive email have all details""",
                  style: openSans12W400(
                    color: const Color(0xff121212).withOpacity(0.8),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  ProfileCubit.get(context).user.email ?? "",
                  style: openSans14W400(color: const Color(0xff717171)),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Row(
                  children: [
                    Text(
                      "Order Number",
                      style: openSans14W500(color: AppColors.primary),
                    ),
                    const Spacer(),
                    Text(
                      "#512 - 77445 5",
                      style: openSans16W500(color: const Color(0xff1E1E1E)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/Order Number.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Text(
                  "Order Summery",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight:
                        CartCubit.get(context).cartMedicalEquipments.length *
                            31.h,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => SummeryRow(
                            text: CartCubit.get(context)
                                .cartMedicalEquipments[index]
                                .medicalEquipment
                                .title,
                            price:
                                '${calculateItemPrice(CartCubit.get(context).cartMedicalEquipments[index].quantity, CartCubit.get(context).cartMedicalEquipments[index].medicalEquipment.price)} SAR',
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 11.h,
                          ),
                          itemCount: CartCubit.get(context)
                              .cartMedicalEquipments
                              .length,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Delivery Fee', price: '+2 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Discount', price: '-90 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Shipping', price: '+5 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Taxes', price: '+1.5 SAR'),
                SizedBox(
                  height: 16.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 16.h,
                ),
                SummeryRow(
                  text: 'Total',
                  price: '${calculateTotalPrice(
                    price: calculateCartTotalPrice(
                      CartCubit.get(context).cartMedicalEquipments,
                      CartCubit.get(context).cartMedicalServices,
                    ),
                    summery: summery,
                  ).toStringAsFixed(2)} $currency',
                ),
                SizedBox(
                  height: 48.h,
                ),
                Text(
                  "Payment method",
                  style: openSans14W500(color: AppColors.primary),
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "Cach",
                      style: openSans12W600(color: const Color(0xff212A2A)),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Image.asset(
                        "assets/images/Cash.png",
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
