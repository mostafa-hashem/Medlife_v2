import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/orders/cubit/orders_cubit.dart';
import 'package:medlife_v2/features/orders/cubit/orders_state.dart';
import 'package:medlife_v2/features/orders/ui/screens/canceled_orders.dart';
import 'package:medlife_v2/features/orders/ui/screens/current_orders.dart';
import 'package:medlife_v2/features/orders/ui/screens/delivered_orders.dart';
import 'package:medlife_v2/features/orders/ui/screens/new_orders.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/error_indicator.dart';
import 'package:medlife_v2/ui/widgets/loading_indicator.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    OrdersCubit.get(context).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is GetOrdersSuccess) {
          OrdersCubit.get(context).getAcceptedOrder();
          OrdersCubit.get(context).getPendingOrders();
          OrdersCubit.get(context).getDeliveredOrders();
          OrdersCubit.get(context).getCanceledOrders();
        }
        if (state is OrderCanceledSuccess) {
          OrdersCubit.get(context).getOrders();
        }
      },
      builder: (context, state) {
        if (state is GetPendingOrdersLoading) {
          return const LoadingIndicator();
        } else if (state is GetPendingOrdersError) {
          return const ErrorIndicator();
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 47.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello ${ProfileCubit.get(context).user.firstName},",
                  style: openSans18W500(color: const Color(0xff576A69)),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  "Orders",
                  style: openSans16W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: const Color(0xfff1f4f6),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 0;
                              });
                            },
                            child: Container(
                              color: currentIndex == 0
                                  ? AppColors.primary
                                  : const Color(0xfff1f4f6),
                              height: 40.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "New",
                                    style: currentIndex == 0
                                        ? openSans12W600(color: Colors.white)
                                        : openSans12W600(
                                            color: const Color(0xff1E1E1E),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 1;
                              });
                            },
                            child: Container(
                              color: currentIndex == 1
                                  ? AppColors.primary
                                  : const Color(0xfff1f4f6),
                              height: 40.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Current",
                                    style: currentIndex == 1
                                        ? openSans12W600(color: Colors.white)
                                        : openSans12W600(
                                            color: const Color(0xff1E1E1E),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 2;
                              });
                            },
                            child: Container(
                              color: currentIndex == 2
                                  ? AppColors.primary
                                  : const Color(0xfff1f4f6),
                              height: 40.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Completed",
                                    style: currentIndex == 2
                                        ? openSans12W600(color: Colors.white)
                                        : openSans12W600(
                                            color: const Color(0xff1E1E1E),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 3;
                              });
                            },
                            child: Container(
                              color: currentIndex == 3
                                  ? AppColors.primary
                                  : const Color(0xfff1f4f6),
                              height: 40.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Canceled",
                                    style: currentIndex == 3
                                        ? openSans12W600(color: Colors.white)
                                        : openSans12W600(
                                            color: const Color(0xff1E1E1E),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (currentIndex == 0)
                   NewOrders()
                else
                  currentIndex == 1
                      ?  CurrentOrders()
                      : currentIndex == 2
                          ?  CompletedOrders()
                          :  CanceledOrders(),
              ],
            ),
          );
        }
      },
    );
  }
}
