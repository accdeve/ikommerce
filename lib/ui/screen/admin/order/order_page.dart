import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/global/order/widget/order_widget.dart';
import 'package:ikommerce/utils/utils_barrel.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool expandedPaid = true;
  bool expandedUnpaid = true;
  bool expandedRequest = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Order",
          style: poppins20SemiBold,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart, color: Colors.blue),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          _buildSection(
            title: "Paid",
            expanded: expandedPaid,
            onToggle: () => setState(() => expandedPaid = !expandedPaid),
            statusColor: green,
            statusLabel: "Paid",
            orders: [
              {
                "product": "order mesin rumput .......",
                "amount": 1290000,
                "user": "butarbutar",
                "date": "10/09/2029",
              },
              {
                "product": "order mesin rumput .......",
                "amount": 1290000,
                "user": "butarbutar",
                "date": "10/09/2029",
              },
            ],
          ),
          _buildSection(
            title: "Unpaid",
            expanded: expandedUnpaid,
            onToggle: () => setState(() => expandedUnpaid = !expandedUnpaid),
            statusColor: red,
            statusLabel: "Unpaid",
            orders: [
              {
                "product": "order mesin rumput .......",
                "amount": 1190000,
                "user": "robinjskd..",
                "date": "10/09/2029",
              },
              {
                "product": "order mesin rumput .......",
                "amount": 1190000,
                "user": "robinjskd..",
                "date": "10/09/2029",
              },
            ],
          ),
          _buildSection(
            title: "Request Stuff",
            expanded: expandedRequest,
            onToggle: () => setState(() => expandedRequest = !expandedRequest),
            statusColor: Colors.grey,
            statusLabel: "Not process",
            orders: [
              {
                "product": "order mesin rumput .......",
                "amount": 1190000,
                "user": "robinjskd..",
                "date": "10/09/2029",
              },
              {
                "product": "order mesin rumput .......",
                "amount": 1190000,
                "user": "robinjskd..",
                "date": "10/09/2029",
              },
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required bool expanded,
    required VoidCallback onToggle,
    required Color statusColor,
    required String statusLabel,
    required List<Map<String, dynamic>> orders,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: poppinsBody16Bold),
            IconButton(
              icon: Icon(expanded
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_right),
              onPressed: onToggle,
            )
          ],
        ),
        const SizedBox(height: 8),
        if (expanded)
          Column(
            children: orders
                .map(
                  (order) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: OrderWidget(
                      status: OrderStatus.paid,
                      product: order["product"],
                      amount: order["amount"],
                      user: order["user"],
                      date: order["date"],
                      isAdmin: true,
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
