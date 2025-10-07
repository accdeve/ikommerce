import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/user/cart/widget/cart_item_widget.dart';
import 'package:ikommerce/ui/screen/user/cart/widget/cart_summary_widget.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/typography.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: CartPage(),
  ));
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text("Cart", style: poppins20SemiBold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  CartItemWidget(
                    imageUrl:
                        "https://www.teknikmart.com/media/wysiwyg/icon-image/jenis-mesin-potong-rumput-dan-cara-merawatnya.jpg",
                    title: "Mesin rumput r3000 aiosidas Aasdlkfjas...",
                    price: "Rp1.800.000",
                  ),
                  CartItemWidget(
                    imageUrl:
                        "https://media.monotaro.id/mid01/full/Perkakas%20Tangan%2C%20Pneumatik%20%26%20Listrik/Perkakas%20Bermesin/Mesin%20Potong%20Rumput/TOTAL%20Mesin%20Potong%20Rumput%20Listrik/7eP106827266-1.jpg",
                    title: "Mesin rumput r3000 aiosidas Aasdlkfjas...",
                    price: "Rp1.800.000",
                  ),
                ],
              ),
            ),
            const CartSummaryWidget(
              chosenText: "3 has choosen",
              total: "Rp1.200.000",
            ),
          ],
        ),
      ),
    );
  }
}
