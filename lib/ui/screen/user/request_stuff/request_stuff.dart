import 'package:flutter/material.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/ui/widgets/text_field_widget.dart';
import 'package:ikommerce/ui/widgets/title_widget.dart';
import 'package:ikommerce/utils/assets.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/typography.dart';

void main(List<String> args) {
  runApp(const MaterialApp(home: RequestStuffPage()));
}

class RequestStuffPage extends StatefulWidget {
  const RequestStuffPage({super.key});

  @override
  State<RequestStuffPage> createState() => _RequestStuffPageState();
}

class _RequestStuffPageState extends State<RequestStuffPage> {
  String selectedAddress =
      "Jl. Raja Alikelana, Belian, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29433";

  final List<String> addresses = [
    "Jl. Raja Alikelana, Belian, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29433",
    "Jl. Ahmad Yani No.10, Batam Kota, Kepulauan Riau 29444",
    "Jl. Sudirman No.22, Nagoya, Kota Batam, Kepulauan Riau 29455",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Request Stuff",
          style: poppins20SemiBold,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: black,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Section
            titleWidget(imagePath: iconProfile, text: "User"),
            const SizedBox(height: 8),
            const CustomTextField(
              inputType: InputType.text,
              hintText: "butarbutar",
              suffixIcons: Icon(Icons.person_outline),
            ),
            const CustomTextField(
              inputType: InputType.email,
              hintText: "example@gmail.com",
              suffixIcons: Icon(Icons.email_outlined),
            ),
            const CustomTextField(
              inputType: InputType.phone,
              hintText: "08098",
              suffixIcons: Icon(Icons.phone_android_outlined),
            ),

            // Address Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleWidget(imagePath: iconAddress, text: "Address"),
                Image.asset(iconChange)
              ],
            ),
            Text(selectedAddress),
            const SizedBox(height: 16),

            // Stuff Section
            const Row(
              children: [
                Icon(Icons.shopping_bag_outlined),
                SizedBox(width: 8),
                Text("Stuff", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            const CustomTextField(
              inputType: InputType.text,
              hintText: "Brand",
            ),
            const CustomTextField(
              inputType: InputType.text,
              hintText: "Type",
            ),
            const CustomTextField(
              inputType: InputType.field,
              hintText: "Description",
            ),

          ],
        ),
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

  void _showAddressModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateModal) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Change Address",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ...addresses.map(
                    (addr) => RadioListTile<String>(
                      title: Text(addr),
                      value: addr,
                      groupValue: selectedAddress,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedAddress = value;
                          });
                          setStateModal(() {});
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
