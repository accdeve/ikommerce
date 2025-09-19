import 'package:flutter/material.dart';
import 'package:ikommerce/utils/assets.dart';

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
        title: const Text("Order"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [Image.asset(iconCart)],
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          
        ),
      ),
    );
  }
}
