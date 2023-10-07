import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/config/utils/components.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_states.dart';
import '../../../config/utils/text_styles.dart';
import '../../../routes/routes.dart';
import '../../pages_indicator/cubit/page_indicator_cubit.dart';
import 'home_widgets/custom_cat_item.dart';
import 'home_widgets/custom_top_rated_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageIndicatorCubit, PageIndicatorState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 79.h,
                ),
                const SearchWidget(),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Hello ${PageIndicatorCubit.get(context).myUser?.firstName} ,",
                  style: openSans18W500(color: Colors.black),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "What are looking for",
                  style: openSans20W600(color: Colors.black),
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 88.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: () {
                          String text = "Medical Equipment";
                          Navigator.pushNamed(context, Routes.medicalEquipments,
                              arguments: text);
                        },
                        child: const CustomCategoryItem(
                          image: "assets/images/Medical Equipment.png",
                          text: "Medical Equipment",
                          color: 0xffDFEECF,
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      const CustomCategoryItem(
                        image: "assets/images/Medical Service.png",
                        text: "Medical Service",
                        color: 0xffCFEEEB,
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      const CustomCategoryItem(
                        image: "assets/images/Blood Bank.png",
                        text: "Blood Bank",
                        color: 0xffE8B997,
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Top rated sale",
                  style: openSans14W500(color: Colors.black),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 180.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.productDetails),
                                  child: const CustomTopRatedItem()),
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 8.w,
                                  ),
                              itemCount: 10)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Most Recommended",
                  style: openSans14W500(color: Colors.black),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 180.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.productDetails),
                                  child: const CustomTopRatedItem()),
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 8.w,
                                  ),
                              itemCount: 10)),
                    ],
                  ),
                ),
                Text(
                  "Recent Added",
                  style: openSans14W500(color: Colors.black),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 180.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.productDetails),
                                  child: const CustomTopRatedItem()),
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 8.w,
                                  ),
                              itemCount: 10)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
