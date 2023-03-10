import 'package:flutter/material.dart';
import 'package:riverpod_demo/utils/app_color.dart';

class CommonTextStyle {
  static Widget label({
    required String text,
    Color color = AppColor.black,
    FontWeight fontWeight = FontWeight.w500,
    double size = 12.0,
  }) {
    return Text(
      text,
      style: TextStyle(color: color,fontWeight: fontWeight,fontSize: size),
      overflow: TextOverflow.ellipsis,
    );
  }
}