import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_app_bar.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_insurance_countainer.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/features/profile/cubit/profile_state.dart';
import 'package:medlife_v2/features/profile/ui/screens/profile_screen.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/utils/data/models/user.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen();

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressDetailsController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool isHome = false;
  bool isWork = false;

  @override
  void initState() {
    super.initState();
    final address = ProfileCubit.get(context).user;
    firstNameController.text = address.firstName!;
    lastNameController.text = address.lastName!;
    addressDetailsController.text = address.address!;
    phoneNumberController.text = address.phoneNumber!;
  }

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
                controller: firstNameController,
                text: "First name",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 27.h,
              ),
              CustomInsuranceContainer(
                controller: lastNameController,
                text: "Last name",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 27.h,
              ),
              CustomInsuranceContainer(
                controller: addressDetailsController,
                text: "Address Details",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 27.h,
              ),
              CustomInsuranceContainer(
                controller: phoneNumberController,
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        isHome = false;
                        isWork = true;
                      });
                    },
                    child: Row(
                      children: [
                        if (isWork)
                          const Icon(
                            Icons.circle,
                            color: AppColors.primary,
                          )
                        else
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
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isHome = true;
                        isWork = false;
                      });
                    },
                    child: Row(
                      children: [
                        if (isHome)
                          const Icon(
                            Icons.circle,
                            color: AppColors.primary,
                          )
                        else
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
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              BlocListener<ProfileCubit, ProfileState>(
                listener: (_, state) {
                  if (state is UpdateUserSuccess) {
                    ProfileCubit.get(context).getUser();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Successfully Saved",
                          style: TextStyle(fontSize: 15),
                        ),
                        backgroundColor: AppColors.primary,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: DefaultTextButton(
                  function: () {
                    ProfileCubit.get(context).updateUser(
                      User(
                        id: ProfileCubit.get(context).user.id,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        dateOfBirth: dateOfBirthController.text,
                        address: addressController.text,
                        companyInsuranceName:
                            companyInsuranceNameController.text,
                        phoneNumber: phoneNumberController.text,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  text: "Save Address",
                  textStyle: openSans16W500(color: Colors.white),
                  height: 65.h,
                  width: double.infinity,
                ),
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
