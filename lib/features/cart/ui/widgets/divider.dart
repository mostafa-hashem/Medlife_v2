import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  const Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
