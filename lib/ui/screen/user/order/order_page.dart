import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/admin/order/order_detail.dart' as admin;
import 'package:ikommerce/ui/screen/user/order/order_detail_page.dart' as user;
import 'package:ikommerce/ui/screen/global/order/widget/order_widget.dart' as widget;
import 'package:ikommerce/utils/assets.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/extensions.dart';
import 'package:ikommerce/utils/typography.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Order",
          style: poppins20SemiBold,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [Image.asset(iconCart)],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                pushScreen(context, const user.OrderDetailPage());
              },
              child: const widget.OrderWidget(
                status: widget.OrderStatus.paid,
                product: "asdfasdfasdfads",
                amount: 2,
                user: "asalsjkd",
                date: "10-09-2004",
                isAdmin: false,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
        ),
      ),
    );
  }
}
