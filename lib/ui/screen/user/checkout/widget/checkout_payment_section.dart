import 'package:flutter/material.dart';
import 'package:ikommerce/utils/typography.dart';
import 'package:ikommerce/utils/utils_barrel.dart';

class CheckoutPaymentSection extends StatelessWidget {
  final bool showDetail;
  final VoidCallback onToggle;

  const CheckoutPaymentSection({
    super.key,
    required this.showDetail,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xfffdfdfd),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onToggle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("How to pay",
                    style: robotoHeading16Bold),
                Icon(showDetail
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ),
          if (showDetail) ...[
            const SizedBox(height: 12),
            Text("Choose Payment Method",
                style: robotoBody12Bold),
            Text(
                "Currently, payment is available via Bank Transfer (Mandiri):\n• Bank: Mandiri\n• Account Number: 123-00-4567890-1\n• Account Name: PT Example E-commerce", style: robotoBody12Light),
            const SizedBox(height: 8),
            Text("Confirm Your Payment",
                style: robotoBody12Bold),
            Text(
                "After making the transfer, please send your payment receipt via WhatsApp Business to:\n📱 +62 812-3456-7890", style: robotoBody12Light),
            const SizedBox(height: 8),
            Text("Verification & Order Processing",
               style: robotoBody12Bold),
            Text(
                "Our team will verify your payment within 1 business day (max 24 hours). Once confirmed, your order will be processed and shipped.", style: robotoBody12Light),
          ]
        ],
      ),
    );
  }
}
