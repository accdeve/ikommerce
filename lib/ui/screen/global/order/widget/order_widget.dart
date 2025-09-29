import 'package:flutter/material.dart';
import 'package:ikommerce/utils/extensions.dart';
import 'package:ikommerce/utils/typography.dart';

// Enum status order
enum OrderStatus { paid, unpaid, process }

class OrderWidget extends StatelessWidget {
  final OrderStatus status;
  final String product;
  final int amount;
  final String user;
  final String date;
  final bool isAdmin;

  const OrderWidget({
    super.key,
    required this.status,
    required this.product,
    required this.amount,
    required this.user,
    required this.date,
    this.isAdmin = false,
  });

  // getter label untuk enum
  String get statusLabel {
    switch (status) {
      case OrderStatus.paid:
        return "Paid";
      case OrderStatus.unpaid:
        return "Unpaid";
      case OrderStatus.process:
        return "Not process";
    }
  }

  // getter warna untuk enum
  Color get statusColor {
    switch (status) {
      case OrderStatus.paid:
        return Colors.green;
      case OrderStatus.unpaid:
        return Colors.red;
      case OrderStatus.process:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status & Arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                statusLabel,
                style: poppinsBody12Bold.copyWith(color: statusColor),
              ),
              const Icon(Icons.arrow_forward_outlined),
            ],
          ),
          const SizedBox(height: 4),

          // Nama produk
          Text(
            shortenText(product, maxLength: 30),
            style: robotoBody12Regular,
          ),
          const SizedBox(height: 12),

          // Harga + User/Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatRupiah(amount), style: robotoBody12Bold),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (isAdmin)
                    Text(
                      user,
                      style: robotoBody12Bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  Text(date, style: robotoBody12Regular),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
