import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/user/order/widget/order_widget.dart';
import 'package:ikommerce/utils/assets.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: OrderDetailPage(),
  ));
}

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Detail"),
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
            return const OrderWidget();
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: 12),
        ),
      ),
    );
  }
}
