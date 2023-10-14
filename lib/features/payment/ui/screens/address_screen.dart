import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_app_bar.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_insurance_countainer.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen();

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final city = TextEditingController();
  final region = TextEditingController();
  final addressDetails = TextEditingController();
  final phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom * 0.6,
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 53.h),
              const CustomAppBar(text: "Address"),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Add new address ...",
                style: openSans16W500(color: AppColors.primary),
              ),
              SizedBox(
                height: 21.h,
              ),
              CustomInsuranceContainer(
                controller: firstName,
                text: "First name",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 27.h,
              ),
              CustomInsuranceContainer(
                controller: firstName,
                text: "Last name",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 27.h,
              ),
              CustomInsuranceContainer(
                controller: city,
                text: "City",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 27.h,
              ),
              CustomInsuranceContainer(
                controller: region,
                text: "Region",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 27.h,
              ),
              CustomInsuranceContainer(
                controller: addressDetails,
                text: "Address Details",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 27.h,
              ),
              CustomInsuranceContainer(
                controller: phoneNumber,
                text: "Phone Number",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                "Default",
                style: openSans14W500(color: const Color(0xff231F20)),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle_outlined),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Work",
                        style: openSans14W400(
                          color: const Color(0xff231F20).withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.circle_outlined),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Home",
                        style: openSans14W400(
                          color: const Color(0xff231F20).withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              DefaultTextButton(
                function: () => Navigator.pop(context),
                text: "Save Address",
                textStyle: openSans16W500(color: Colors.white),
                height: 65.h,
                width: double.infinity,
              ),
              SizedBox(
                height: 53.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
