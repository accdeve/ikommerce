import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/user/cart/cart_page.dart';
import 'package:ikommerce/ui/screen/user/order/widget/list_stuff_widget.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/ui/widgets/title_widget.dart';
import 'package:ikommerce/utils/assets.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/extensions.dart';
import 'package:ikommerce/utils/typography.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Order Detail",
          style: poppins20SemiBold,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          InkWell(
              onTap: () {
                pushScreen(context, const CartPage());
              },
              child: Image.asset(iconCart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xffFDFDFD),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: lightGrey),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //stuff
              titleWidget(imagePath: iconStuff, text: "Stuff"),
              stuffWidget(2, "stuffName", 1000000),
              const SizedBox(height: 20),
              stuffWidget(2, "stuffName", 1000000),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Total",
                    style: robotoHeading16Bold,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    formatRupiah(10000000),
                    style: robotoHeading16Bold,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),

              // address
              titleWidget(imagePath: iconAddress, text: "Address"),
              Text(
                  "Jl Raya aji kelana dimana anak saya dimana papa saya, anak kampung tuan ada di pasar baru",
                  style: robotoBody16Regular),

              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              titleWidget(imagePath: iconTime, text: "Time"),
              Text("21:40, 10 September 2025", style: robotoBody16Regular),

              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              titleWidget(imagePath: iconStuff, text: "Status"),
              Text(
                "Paid",
                style: robotoHeading16Bold.copyWith(color: green),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton.contained(
            label: "Back",
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
