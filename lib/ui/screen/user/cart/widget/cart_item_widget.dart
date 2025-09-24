import 'package:flutter/material.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/typography.dart';
import 'package:ikommerce/utils/utils_barrel.dart';

class CartItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const CartItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white, // whiteFill
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Checkbox
          Checkbox(
            value: false,
            onChanged: (_) {},
          ),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Title + Price + Delete
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: robotoBody12Regular,
                ),
                const SizedBox(height: 20),
                Text(price, style: robotoBody12Bold),
              ],
            ),
          ),

          // Quantity control
          Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: primaryLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(Icons.remove, size: 20,color: white,),
                  ),
                  const SizedBox(width: 6),
                  const Text("1"),
                  const SizedBox(width: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(Icons.add, size: 20, color: white,),
                  ),
                ],
              ),
                const SizedBox(height: 32),
                GestureDetector(
                  onTap: () {},
                  child: const Text("delete", style: TextStyle(color: red)),
                )
            ],
          )
        ],
      ),
    );
  }
}
