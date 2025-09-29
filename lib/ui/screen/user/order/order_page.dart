import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/global/order/widget/order_widget.dart';
import 'package:ikommerce/utils/assets.dart';
import 'package:ikommerce/utils/typography.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: OrderPage(),
  ));
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order", style: poppins20SemiBold,),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
            return const OrderWidget(
                      status: OrderStatus.paid,
                      product: "asdfasdfasdfads",
                      amount: 2,
                      user: "asalsjkd",
                      date: "10-09-2004",
                      isAdmin: true,
                    );
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: 12),
        ),
      ),
    );
  }
}
