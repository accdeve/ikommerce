import 'package:flutter/material.dart';

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
