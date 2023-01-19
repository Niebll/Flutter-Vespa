import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Text CustomText({required String text,required double size,required Color color}) {
  final Color color = Colors.white;
  return Text(text, style: GoogleFonts.bebasNeue(fontSize: size, color: color),);
}
