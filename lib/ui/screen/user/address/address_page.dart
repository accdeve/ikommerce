import 'package:flutter/material.dart';
import 'package:ikommerce/data/province_data.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/ui/widgets/dropdown_widget.dart';
import 'package:ikommerce/ui/widgets/text_field_widget.dart';
import 'package:ikommerce/utils/typography.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: AddressFormPage(),
  ));
}

class AddressFormPage extends StatelessWidget {
  const AddressFormPage({
    super.key,
    this.isUpdate = false,
  });

  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Add Address",
          style: poppins20SemiBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomDropdownButton(
              hint: "Province",
              value: "Aceh",
              onChanged: (value) {},
              dropdownItems: provinces,
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              inputType: InputType.text,
              hintText: "City",
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              inputType: InputType.text,
              hintText: "Subdistrict",
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    inputType: InputType.text,
                    hintText: "Ward",
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    inputType: InputType.number,
                    hintText: "Pos Code",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              inputType: InputType.text,
              hintText: "Street",
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              inputType: InputType.text,
              hintText: "House Number",
            ),
            const Spacer(),
            if (isUpdate) ...[
              // Tombol Hapus kalau Update
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    // TODO: action delete address
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
            // Tombol Create / Save
            SizedBox(
              width: double.infinity,
              child: CustomButton.contained(
                label: "Create",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
