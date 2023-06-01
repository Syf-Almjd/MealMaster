import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Widget textFieldA({
  Key? key,
  required TextEditingController controller,
  required String hintText,
  required bool obscureText,
  required Icon prefixIcon,
  void Function(String)? onChanged,
}) {
  return TextField(
    key: key,
    controller: controller,
    obscureText: obscureText,
    cursorColor: HexColor("#4f4f4f"),
    decoration: InputDecoration(
      hintText: hintText,
      fillColor: HexColor("#f0f3f1"),
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      hintStyle: GoogleFonts.poppins(
        fontSize: 15,
        color: HexColor("#8d8d8d"),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      prefixIcon: prefixIcon,
      prefixIconColor: HexColor("#4f4f4f"),
      filled: true,
    ),
    onChanged: onChanged,
  );
}



Widget buttonA({
  final Function()? onPressed,
  required final String buttonText,
  int? height,
  int? width,
  Color? color,
  int? borderSize,
  Color? textColor,

}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: (height ?? 55).toDouble(),
      width: (height ?? 275).toDouble(),
      decoration: BoxDecoration(
        color: (color ?? HexColor('#eb9634')),
        borderRadius: BorderRadius.circular((borderSize ?? 20).toDouble(),),
      ),
      child: Center(
        child: Text(buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: (textColor ?? Colors.white))),
      ),
    ),
  );
}
