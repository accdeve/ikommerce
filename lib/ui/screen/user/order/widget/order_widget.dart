import 'package:flutter/material.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/extensions.dart';
import 'package:ikommerce/utils/typography.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFE0E0E0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Paid", style: poppinsBody12Bold.copyWith(color: green),),
              const Icon(Icons.arrow_forward_outlined),
            ],
          ),
          Text(shortenText("Nama produk", maxLength: 30), style: robotoBody12Regular),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatRupiah(1000000), style: robotoBody12Bold,),
              const Text("10/09/2023"),
            ],
          ),
        ],
      ),
    );
  }
}
