import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';


class CustomProfileContainer extends StatefulWidget {
  final TextInputType textInputType;
  final String labelText;
  final String containerText;
  final IconData? icon;

  const CustomProfileContainer({
    required this.labelText,
    required this.containerText,
    required this.textInputType,
    this.icon,
  });

  @override
  State<CustomProfileContainer> createState() => _CustomProfileContainerState();
}

class _CustomProfileContainerState extends State<CustomProfileContainer> {
  bool _isCalenderVisible = false;
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat("d/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style:
              openSans14W400(color: const Color(0xff1E1E1E).withOpacity(0.5)),
        ),
        SizedBox(
          height: 8.h,
        ),
        InkWell(
          onTap: () {
            if(widget.icon != null) {
              setState(() {
              _isCalenderVisible = !_isCalenderVisible;
            });
            }
          },
          child: Container(
            height: 46.h,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width - 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor, width: 2.w),
              borderRadius: BorderRadius.circular(7.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(widget.icon != null ? _dateFormat.format(_selectedDate) : widget.containerText),
                  const Spacer(),
                  Icon(
                    widget.icon,
                    color: AppColors.borderColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: _isCalenderVisible,
          child: CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(1975),
            lastDate: DateTime.now(),
            onDateChanged: (value) => {
              setState(() {
                _selectedDate = value;
                _isCalenderVisible = !_isCalenderVisible;
              }),
            },
          ),
        ),
      ],
    );
  }
}
