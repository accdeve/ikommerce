import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/user/checkout/widget/checkout_address_modal.dart';
import 'package:ikommerce/ui/screen/user/checkout/widget/checkout_payment_section.dart';
import 'package:ikommerce/ui/screen/user/checkout/widget/checkout_stuff_section.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/typography.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: CheckoutPage(),
  ));
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
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: whiteFill,
        leading: const BackButton(color: black),
        title: Text("Checkout", style: poppins20SemiBold),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CheckoutStuffSection(
            address: _selectedAddress,
            onEditTap: _openAddressModal,
          ),

          const SizedBox(height: 16),

          CheckoutPaymentSection(
            showDetail: _showPaymentDetail,
            onToggle: () {
              setState(() {
                _showPaymentDetail = !_showPaymentDetail;
              });
            },
          ),

          const SizedBox(height: 16),

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton.contained(
          label: "Get Invoice",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
