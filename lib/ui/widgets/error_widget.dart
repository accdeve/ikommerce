import 'package:flutter/material.dart';
import 'package:ikommerce/utils/utils_barrel.dart';

Widget errorWidget(BoxConstraints constraints) {
  return ListView(
    physics: const AlwaysScrollableScrollPhysics(),
    shrinkWrap: true,
    children: [
      SizedBox(
        height: constraints.maxHeight / 2.5,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   img_wifi,
          //   height: 100,
          // ),
          const SizedBox(height: 10),
          Text(
            "Something went wrong.",
            textAlign: TextAlign.center,
            style: poppinsBody12Regular,
          ),
          Text(
            "Pull to refresh.",
            textAlign: TextAlign.center,
            style: poppinsBody12Regular,
          ),
        ],
      ),
    ],
  );
}
