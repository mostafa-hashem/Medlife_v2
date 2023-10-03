import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/utils/text_styles.dart';
import '../../../routes/routes.dart';
import '../cubit/home_cubit.dart';
import 'home_widgets/custom_cat_item.dart';
import 'home_widgets/custom_top_rated_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit.get(context).initUser();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeConnectedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Connected")));
        } else if (state is HomeNotConnectedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Disconnected')));
        }
      },
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
                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: Colors.transparent)),
                  child: TextField(
                    onChanged: (value) {},
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                          color: const Color(0xff000000).withOpacity(0.5),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      hintText: 'What are looking for',
                      hintStyle: TextStyle(
                          color: const Color(0xff000000).withOpacity(0.5),
                          letterSpacing: -1,
                          fontSize: 12.sp),
                      suffixIcon: Icon(
                        Icons.search,
                        color: const Color(0xff000000).withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Hello ${HomeCubit.get(context).myUser?.firstName} ,",
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
                      const CustomCategoryItem(
                        image: "assets/images/Medical Equipment.png",
                        text: "Medical Equipment",
                        color: 0xffDFEECF,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
