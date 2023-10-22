import 'package:flutter/material.dart';

List drawer = [
  'Anas Warehouse',
  'ReciveOrder',
  'dashboard',
  'Contactus',
  'Wallet',
  'Logout'
];
List<String> draweImageAvatar = [
  'assests/image/gamer.png',
  'assests/image/reciveorder.png',
  'assests/image/dashboard.png',
  'assests/image/headphone.png',
  'assests/image/wallet.png',
  'assests/image/logout.png',
];

// ignore: must_be_immutable
class TextDefault extends StatelessWidget {
  TextDefault(
      {super.key,
      required this.maxLine,
      required this.colorText,
      required this.fontWeight,
      required this.fontsize,
      required this.textOverflow,
      required this.contentText});
  Color colorText;
  String contentText;
  double? fontsize;
  FontWeight? fontWeight;
  TextOverflow? textOverflow;
  int maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      contentText,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        color: colorText,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}
