import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget MyText({
  final String? title,
  final double? size,
  final Color? color,
  final TextAlign? align,
  final FontWeight? weight,
}) {
  return Text(
    title!,
    style: GoogleFonts.inter(
      fontWeight: weight ?? FontWeight.w500,
      color: color,
      fontSize: size,
    ),
    textAlign: align,
  );
}
