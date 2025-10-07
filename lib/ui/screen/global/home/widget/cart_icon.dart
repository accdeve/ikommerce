import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/user/cart/cart_page.dart';
import 'package:ikommerce/utils/assets.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/extensions.dart';

class CartIconWithBadge extends StatelessWidget {
  final int count;
  final double size;
  final bool isAdmin;

  const CartIconWithBadge({
    super.key,
    required this.count,
    this.size = 70,
    this.isAdmin = false, // default bukan admin
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushScreen(context, const CartPage());
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isAdmin
                  ? const Icon(Icons.add, size: 32, color: Colors.black)
                  : Image.asset(iconCart),
            ),
          ),
          if (!isAdmin && count > 0)
            Positioned(
              right: 1,
              top: -2,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  "$count",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
