import 'package:flutter/material.dart';
import 'package:ikommerce/utils/colors.dart';

class BoxLoadingWidget extends StatelessWidget {
  const BoxLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          color: lightGrey2,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
