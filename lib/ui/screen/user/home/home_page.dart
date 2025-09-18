import "package:flutter/material.dart";
import "package:ikommerce/ui/widgets/text_field_widget.dart";
import "package:ikommerce/utils/utils_barrel.dart";

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(iconOrderHasRead, width: 24, height: 24),
          Image.asset(iconProfile, width: 24, height: 24),
        ],
        title: const CustomTextField(
          isUsingPadding: false,
          hintText: "Search products",
          prefixIcons: Icon(Icons.search),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 262,
              width: double.infinity,
              child: Image(
                  image: Image.network(
                "https://via.placeholder.com/800x262.png", // ganti dengan URL/banner kamu
                fit: BoxFit.cover,
              ).image),
            ),
            const SizedBox(height: 24),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stuff",
                      style: poppinsBody16Medium,
                    ),
                    Text.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        text: "Not Found? ",
                        style: poppinsBody10Light,
                        children: [
                          TextSpan(
                            text: "Request Stuff",
                            style: poppinsBody10Medium.copyWith(color: primary),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
