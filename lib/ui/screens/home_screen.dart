import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_cubit.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_state.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/custom_cat_item.dart';
import 'package:medlife_v2/ui/widgets/error_indicator.dart';
import 'package:medlife_v2/ui/widgets/home_medical_equipment_item.dart';
import 'package:medlife_v2/ui/widgets/loading_indicator.dart';
import 'package:medlife_v2/ui/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicalEquipmentsCubit, MedicalEquipmentsState>(
      listener: (_, state) {
        if (state is GetAllMedicalEquipmentsSuccess) {
          MedicalEquipmentsCubit.get(context).getTopRatedMedicalEquipments();
          MedicalEquipmentsCubit.get(context)
              .getMostRecommendedMedicalEquipments();
          MedicalEquipmentsCubit.get(context)
              .getRecentlyAddedMedicalEquipments();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 39.h,
              ),
              const SearchWidget(),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Hello ${ProfileCubit.get(context).user.firstName} ,",
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
                height: 110.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.medicalEquipments,
                        );
                      },
                      child: const CustomCategoryItem(
                        image: "assets/images/Medical Equipment.png",
                        text: "Medical Equipment",
                        color: 0xffDFEECF,
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.medicalServices,
                        );
                      },
                      child: const CustomCategoryItem(
                        image: "assets/images/Medical Service.png",
                        text: "Medical Service",
                        color: 0xffCFEEEB,
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.bloodBanks,
                        );
                      },
                      child: const CustomCategoryItem(
                        image: "assets/images/Blood Bank.png",
                        text: "Blood Bank",
                        color: 0xffE8B997,
                      ),
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
                height: 200.h,
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<MedicalEquipmentsCubit,
                          MedicalEquipmentsState>(
                        buildWhen: (_, currentState) =>
                            currentState
                                is GetTopRatedMedicalEquipmentsLoading ||
                            currentState is GetTopRatedMedicalEquipmentsError ||
                            currentState is GetTopRatedMedicalEquipmentsSuccess,
                        builder: (context, state) {
                          if (state is GetTopRatedMedicalEquipmentsLoading) {
                            return const LoadingIndicator();
                          } else if (state
                              is GetTopRatedMedicalEquipmentsError) {
                            return const ErrorIndicator();
                          }
                          return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final medicalEquipment =
                                  MedicalEquipmentsCubit.get(context)
                                      .topRatedMedicalEquipments[index];
                              return GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  Routes.medicalEquipmentDetails,
                                  arguments: medicalEquipment,
                                ),
                                child:
                                    HomeMedicalEquipmentItem(medicalEquipment),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              width: 8.w,
                            ),
                            itemCount: MedicalEquipmentsCubit.get(context)
                                .topRatedMedicalEquipments
                                .length,
                          );
                        },
                      ),
                    ),
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
                height: 200.h,
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<MedicalEquipmentsCubit,
                          MedicalEquipmentsState>(
                        buildWhen: (_, currentState) =>
                            currentState
                                is GetMostRecommendedMedicalEquipmentsLoading ||
                            currentState
                                is GetMostRecommendedMedicalEquipmentsError ||
                            currentState
                                is GetMostRecommendedMedicalEquipmentsSuccess,
                        builder: (context, state) {
                          if (state
                              is GetMostRecommendedMedicalEquipmentsLoading) {
                            return const LoadingIndicator();
                          } else if (state
                              is GetMostRecommendedMedicalEquipmentsError) {
                            return const ErrorIndicator();
                          }
                          return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final medicalEquipment =
                                  MedicalEquipmentsCubit.get(context)
                                      .mostRecommendedMedicalEquipments[index];
                              return GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  Routes.medicalEquipmentDetails,
                                  arguments: medicalEquipment,
                                ),
                                child:
                                    HomeMedicalEquipmentItem(medicalEquipment),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              width: 8.w,
                            ),
                            itemCount: MedicalEquipmentsCubit.get(context)
                                .mostRecommendedMedicalEquipments
                                .length,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Recent Added",
                style: openSans14W500(color: Colors.black),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 200.h,
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<MedicalEquipmentsCubit,
                          MedicalEquipmentsState>(
                        buildWhen: (_, currentState) =>
                            currentState
                                is GetRecentlyAddedMedicalEquipmentsLoading ||
                            currentState
                                is GetRecentlyAddedMedicalEquipmentsError ||
                            currentState
                                is GetRecentlyAddedMedicalEquipmentsSuccess,
                        builder: (context, state) {
                          if (state
                              is GetRecentlyAddedMedicalEquipmentsLoading) {
                            return const LoadingIndicator();
                          } else if (state
                              is GetRecentlyAddedMedicalEquipmentsError) {
                            return const ErrorIndicator();
                          }
                          return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final medicalEquipment =
                                  MedicalEquipmentsCubit.get(context)
                                      .recentlyAddedMedicalEquipments[index];
                              return GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  Routes.medicalEquipmentDetails,
                                  arguments: medicalEquipment,
                                ),
                                child:
                                    HomeMedicalEquipmentItem(medicalEquipment),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              width: 8.w,
                            ),
                            itemCount: MedicalEquipmentsCubit.get(context)
                                .recentlyAddedMedicalEquipments
                                .length,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
