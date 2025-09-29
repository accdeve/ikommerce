import 'package:flutter/material.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/ui/widgets/text_field_widget.dart';
import 'package:ikommerce/utils/assets.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: StuffPage(),
  ));
}

class StuffPage extends StatefulWidget {
  const StuffPage({super.key});

  @override
  State<StuffPage> createState() => _StuffPageState();
}

class _StuffPageState extends State<StuffPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  bool _hasImage = false;

  @override
  Widget build(BuildContext context) {
    final bool isValid = _nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _quantityController.text.isNotEmpty &&
        _descController.text.isNotEmpty &&
        _hasImage;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Stuff",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomTextField(
            controller: _nameController,
            inputType: InputType.text,
            hintText: "Stuff Name",
            keyboardType: TextInputType.name,
            suffixIcons: Image.asset(iconStuff),
            onChanged: (_) => setState(() {}),
          ),

          // Price & Quantity
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomTextField(
                  controller: _priceController,
                  inputType: InputType.text,
                  hintText: "Price",
                  keyboardType: TextInputType.number,
                  suffixIcons: const Icon(Icons.attach_money),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomTextField(
                  controller: _quantityController,
                  inputType: InputType.text,
                  hintText: "Quantity",
                  keyboardType: TextInputType.number,
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),

          // Description
          CustomTextField(
            controller: _descController,
            inputType: InputType.field,
            hintText: "Description",
            keyboardType: TextInputType.name,
            onChanged: (_) => setState(() {}),
          ),

          // Image
          const Text("Image",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _hasImage = !_hasImage; // sementara, simulasi
              });
            },
            child: _hasImage
                ? Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://www.teknikmart.com/media/wysiwyg/icon-image/jenis-mesin-potong-rumput-dan-cara-merawatnya.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add, color: Colors.blue, size: 30),
                  ),
          ),
          const SizedBox(height: 40),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton.contained(
          label: "Create",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
