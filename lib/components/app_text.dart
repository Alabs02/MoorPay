import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moorpay/constants/colors_constant.dart';

class AppText extends StatelessWidget {
  const AppText({
    this.copy = "",
    this.size = 10.0,
    this.tracking = 1.0,
    this.color = kBlackColor,
    this.weight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    Key? key,
  }) : super(key: key);

  final String copy;
  final double size;
  final double tracking;
  final FontWeight weight;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$copy',
      textAlign: textAlign,
      style: GoogleFonts.inter(
          color: color,
          fontSize: size,
          fontWeight: weight,
          letterSpacing: tracking),
    );
  }
}
