import 'package:flutter/material.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class FilterRow extends StatelessWidget {
  final String text;

  const FilterRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: openSans16W400(color: Colors.white),
        ),
        const Spacer(),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 15,
          color: Colors.white,
        ),
      ],
    );
  }
}
