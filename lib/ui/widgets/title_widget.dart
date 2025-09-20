import 'package:flutter/material.dart';
import 'package:ikommerce/utils/typography.dart';
// import poppinsBody16Bold sesuai lokasi utils typography kamu

Widget titleWidget({
  required String imagePath,
  required String text,
  TextStyle? textStyle,
}) {
  return Row(
    children: [
      Image.asset(imagePath),
      const SizedBox(width: 8), // jarak default biar gak terlalu nempel
      Text(
        text,
        style: textStyle ?? poppinsBody16Bold, // default style tetap poppinsBody16Bold
      ),
    ],
  );
}
