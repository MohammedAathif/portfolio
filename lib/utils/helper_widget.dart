import 'package:flutter/material.dart';

Widget commonTextField(
    {
      //required TextEditingController controller,
      void Function(String)? onSubmit,
      required String hintText,
      TextInputType? keyboardType,
      Widget? suffixIcon,
      int maxLines = 1,
      bool obscureText = false}) {
  return  TextField(
    maxLines: maxLines,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        border: InputBorder.none,
        hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: maxLines > 1 ? const EdgeInsets.fromLTRB(10, 20, 0, 0) : null,
    ),
  );
  return TextField(
    keyboardType: keyboardType,
    onSubmitted: onSubmit,
    // controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      filled: true,
      //fillColor: AppColors.white,
      hintText: hintText,
      suffixIcon: suffixIcon,
      // hintStyle: GoogleFonts.roboto(
      //     color: const Color(0xffBCBEC0),
      //     fontSize: 13,
      //     fontWeight: FontWeight.w500),
    ),
  );
}