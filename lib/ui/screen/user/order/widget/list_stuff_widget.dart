import 'package:flutter/material.dart';
import 'package:ikommerce/utils/extensions.dart';
import 'package:ikommerce/utils/typography.dart';

Widget stuffWidget(int quantity,String stuffName, int price) {
  return Row(
    children: [
      Text("$quantity", style: robotoBody16Regular,),
      Spacer(),
      Text(stuffName, style: robotoBody16Regular,),
      const Spacer(flex: 2,),
      Text(formatRupiah(price), style: robotoHeading16Bold,),
    ],
  );
}
