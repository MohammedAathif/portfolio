import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


Widget commonTextField({
  required TextEditingController controller,required String hintText,
  required String? Function(String?) validator
}) {
  return  Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 15),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    ),
  );
}

Future<void> openUrl(Uri url) async {
  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(url); // Use launchUrl
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print('catched error $e');
  }
}