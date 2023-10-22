import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class circularButtom extends StatelessWidget {
  circularButtom({
    required this.textcolor,
    required this.icon,
    required this.onLongPress,
    required this.onLongPressEnd,
    required this.onTap,
    super.key,
  });
  Icon icon;
  Color textcolor;
  void Function()? onLongPress;
  void Function(LongPressEndDetails)? onLongPressEnd;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: onLongPress,
        onLongPressEnd: onLongPressEnd,
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: textcolor,
          child: icon,
        ));
  }
}
