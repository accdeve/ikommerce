import 'package:flutter/material.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/ui/widgets/title_widget.dart';
import 'package:ikommerce/utils/assets.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/typography.dart';
import 'package:ikommerce/utils/utils_barrel.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: OrderDetailPage(),
  ));
}

enum OrderStatus { paid, unpaid, process }

extension OrderStatusExtension on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.paid:
        return "Paid";
      case OrderStatus.unpaid:
        return "Unpaid";
      case OrderStatus.process:
        return "Process";
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.paid:
        return Colors.green;
      case OrderStatus.unpaid:
        return Colors.red;
      case OrderStatus.process:
        return Colors.orange;
    }
  }
}

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  OrderStatus selectedStatus = OrderStatus.unpaid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Order Detail", style: poppins20SemiBold,),
        centerTitle: true,
        leading: const BackButton(color: black,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- USER INFO ----------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleWidget(imagePath: iconProfile, text: "User Information"),
                  const SizedBox(height: 8),
                  _infoRow(Icons.person, "butarbutara"),
                  _infoRow(Icons.email, "butarbutara@gmail.com"),
                  _infoRow(Icons.phone, "082345234626"),
                  _infoRow(Icons.access_time, "21:40, 10 September 2025"),
                  _infoRow(Icons.location_on,
                      "Jl. Raja Alikelana, Belian, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29433"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ---------------- STUFF ----------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: 
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     titleWidget(imagePath: iconStuff, text: "Stuff"),
              //     const SizedBox(height: 8),
              //     stuffWidget(2, "stuffName", 1000000),
              //     const SizedBox(height: 8),
              //     stuffWidget(2, "stuffName", 1000000),
              //     const SizedBox(height: 8),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Text(
              //           "Total",
              //           style: robotoHeading16Bold,
              //         ),
              //         const SizedBox(width: 20),
              //         Text(
              //           formatRupiah(10000000),
              //           style: robotoHeading16Bold,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              Column(
                children: [
                  titleWidget(imagePath: iconStuff, text: "Stuff"),
                  SizedBox(height: 16),
                  _infoRow(Icons.person, "Mesin bubut ax03020930"),
                  _infoRow(Icons.email, "Tipe 019i09423"),
                  _infoRow(Icons.phone, "Mesin pemotong untuk memotong sebuah benda agar benda tersebut menjadi terpotong kembali, lalu kita akan menggunkan banyak hal lagi untuk menggunakna kembali"),
                ],
              )
            ),

            // ---------------- STATUS ----------------
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Status", style: poppinsBody12Bold),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<OrderStatus>(
                    value: selectedStatus,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: OrderStatus.values.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(
                          status.label,
                          style: TextStyle(color: status.color),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => selectedStatus = value);
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton.contained(
          label: "Update",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: robotoBody14Regular)),
        ],
      ),
    );
  }
}
