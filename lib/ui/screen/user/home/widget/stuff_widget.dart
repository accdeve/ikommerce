import 'package:flutter/material.dart';

class StuffWidget extends StatelessWidget {
  const StuffWidget({super.key});
  final String stuffName = "";
  final int suffPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "https://via.placeholder.com/150", // ganti dengan URL/gambar stuff kamu
          width: 100,
          height: 100,
        ),
        Text("data")
      ],
    );
  }
}