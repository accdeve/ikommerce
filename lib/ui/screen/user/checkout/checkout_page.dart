import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(home: CheckoutPage()));
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool _showPaymentDetail = false;
  String _selectedAddress =
      "Jl. Raja Alikelana, Belian, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29433";

  void _openAddressModal() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => ChangeAddressModal(
        selectedAddress: _selectedAddress,
        addresses: const [
          "Jl. Raja Alikelana, Belian, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29433",
          "Jl. Imam Bonjol No.123, Kota Batam",
          "Jl. Sudirman No.45, Batam Center",
        ],
      ),
    );

    if (result != null) {
      setState(() {
        _selectedAddress = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Section Stuff
          const CheckoutStuffSection(),

          const SizedBox(height: 16),
          const Divider(),

          // Section Address
          CheckoutAddressSection(
            address: _selectedAddress,
            onEditTap: _openAddressModal,
          ),

          const SizedBox(height: 16),

          // Section Payment
          CheckoutPaymentSection(
            showDetail: _showPaymentDetail,
            onToggle: () {
              setState(() {
                _showPaymentDetail = !_showPaymentDetail;
              });
            },
          ),

          const SizedBox(height: 16),

          const Text(
            "*order information will be sent to your email",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Get Invoice",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Section Barang
class CheckoutStuffSection extends StatelessWidget {
  const CheckoutStuffSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xfffdfdfd),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.shopping_bag_outlined, size: 18),
              SizedBox(width: 6),
              Text("Stuff", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("2  Mesin rumput 10928402"),
              Text("Rp900.000", style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("2  Mesin rumput 10928402"),
              Text("Rp900.000", style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Rp1.800.000",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

// 🔹 Section Address
class CheckoutAddressSection extends StatelessWidget {
  final String address;
  final VoidCallback onEditTap;

  const CheckoutAddressSection({
    super.key,
    required this.address,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xfffdfdfd),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.location_on_outlined),
          const SizedBox(width: 8),
          Expanded(child: Text(address)),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: onEditTap,
          )
        ],
      ),
    );
  }
}

// 🔹 Section Payment
class CheckoutPaymentSection extends StatelessWidget {
  final bool showDetail;
  final VoidCallback onToggle;

  const CheckoutPaymentSection({
    super.key,
    required this.showDetail,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xfffdfdfd),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onToggle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("How to pay",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Icon(showDetail
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ),
          if (showDetail) ...[
            const SizedBox(height: 12),
            const Text("Choose Payment Method",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const Text(
                "Currently, payment is available via Bank Transfer (Mandiri):\n• Bank: Mandiri\n• Account Number: 123-00-4567890-1\n• Account Name: PT Example E-commerce"),
            const SizedBox(height: 8),
            const Text("Confirm Your Payment",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const Text(
                "After making the transfer, please send your payment receipt via WhatsApp Business to:\n📱 +62 812-3456-7890"),
            const SizedBox(height: 8),
            const Text("Verification & Order Processing",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const Text(
                "Our team will verify your payment within 1 business day (max 24 hours). Once confirmed, your order will be processed and shipped."),
          ]
        ],
      ),
    );
  }
}

// 🔹 Modal Ganti Alamat
class ChangeAddressModal extends StatefulWidget {
  final String selectedAddress;
  final List<String> addresses;

  const ChangeAddressModal({
    super.key,
    required this.selectedAddress,
    required this.addresses,
  });

  @override
  State<ChangeAddressModal> createState() => _ChangeAddressModalState();
}

class _ChangeAddressModalState extends State<ChangeAddressModal> {
  late String _currentSelected;

  @override
  void initState() {
    super.initState();
    _currentSelected = widget.selectedAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Change Address",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          ...widget.addresses.map((address) {
            return RadioListTile<String>(
              title: Text(address),
              value: address,
              groupValue: _currentSelected,
              onChanged: (val) {
                setState(() {
                  _currentSelected = val!;
                });
                Navigator.pop(context, val);
              },
            );
          }),
        ],
      ),
    );
  }
}
