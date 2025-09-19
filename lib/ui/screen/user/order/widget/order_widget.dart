import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Paid"),
              Icon(Icons.arrow_forward_outlined),
              Text("Nama produl"),
              
            ],
          )
        ],
      ),
    );
  }
}
