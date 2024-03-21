import 'package:flutter/material.dart';

Widget CustomBbox({
  final double? height,
  final double? width,
  final Color? color,
  final BorderRadius? radius,
  final BoxShape? shapes,
  final Widget? widget,
  final Color? shadowcolor,
  final Color? borderColor,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(14),
      shape: shapes ?? BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: shadowcolor ?? Colors.transparent,
          offset: Offset(0, 4),
          blurRadius: 15,
        ),
      ],
      border: Border.all(
        color: borderColor ?? Colors.transparent,
        width: 2,
      ),
    ),
    child: widget,
  );
}
