import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_app_bar.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_insurance_countainer.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';

class InsurancePaymentScreen extends StatefulWidget {
  const InsurancePaymentScreen();

  @override
  State<InsurancePaymentScreen> createState() => _InsurancePaymentScreenState();
}

class _InsurancePaymentScreenState extends State<InsurancePaymentScreen> {
  final idNumberController = TextEditingController();
  final companyInsuranceNameController = TextEditingController();
  final phoneController = TextEditingController();
  final productListController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final insurance = ProfileCubit.get(context).user;
    idNumberController.text = insurance.idNumber!;
    companyInsuranceNameController.text = insurance.companyInsuranceName!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 68.h, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(text: 'Insurance Payment'),
              SizedBox(
                height: 27.h,
              ),
              Text(
                "Product list",
                style: openSans14W500(color: AppColors.primary),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomInsuranceContainer(
                controller: idNumberController,
                text: "ID Number",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomInsuranceContainer(
                controller: phoneController,
                text: "Mobile Number",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomInsuranceContainer(
                controller: companyInsuranceNameController,
                text: "Company insurance name",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomInsuranceContainer(
                maxLines: 5,
                controller: productListController,
                text: "Product list",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomInsuranceContainer(
                controller: noteController,
                text: "Note",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 24.h,
              ),
              DefaultTextButton(
                function: () {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.successfulPayment,
                  );
                },
                text: "Send Request",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
