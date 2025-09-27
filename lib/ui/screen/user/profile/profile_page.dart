import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ikommerce/ui/screen/user/home/widget/stuff_widget.dart';
import 'package:ikommerce/ui/screen/user/profile/widget/address_widget.dart';
import 'package:ikommerce/utils/typography.dart';
import 'package:ikommerce/utils/utils_barrel.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: ProfilePage()));
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedAddress =
      "Jl. Raja Alikelana, Belian, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29433";

  final List<String> addresses = [
    "Jl. Raja Alikelana, Belian, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29433",
    "Jl. Imam Bonjol No.123, Kota Batam",
    "Jl. Sudirman No.45, Batam Center",
  ];

  final List<Map<String, dynamic>> boughtStuffs = [
    {"name": "Mesin potong rumput a0294jjak askjldhfkjahsdfj", "price": 1000000},
    {"name": "Mesin potong rumput a0294jjak askjldhfkjahsdfj", "price": 1000000},
    {"name": "Mesin potong rumput a0294jjak askjldhfkjahsdfj", "price": 1000000},
    {"name": "Mesin potong rumput a0294jjak askjldhfkjahsdfj", "price": 1000000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Profile",
          style: poppins20SemiBold,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Info
          Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black12,
                child: Icon(Icons.person, size: 50, color: Colors.black),
              ),
              SizedBox(height: 8),
              Text(
                "Butarbuta",
                style: robotoHeading16Bold,
              ),
              Text("Butarbuta@gmail.com", style: robotoBody14Regular,),
            ],
          ),
          const SizedBox(height: 24),

          // Address Section
          Text("Adress",
              style: poppinsBody16Bold),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: addresses.map((addr) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: AddressWidget(
                    address: addr,
                    isSelected: selectedAddress == addr,
                    onTap: () {
                      setState(() {
                        selectedAddress = addr;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 24),

          // Bought Stuff
          const Text("Bought Stuff",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: boughtStuffs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.78,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final stuff = boughtStuffs[index];
              return StuffWidget(
                isDeleteMode: false,
                isSelected: false,
                onSelected: () {
                  
                },
                isAdmin: false,
                stuffName: stuff["name"],
                stuffPrice: stuff["price"],
              );
            },
          )
        ],
      ),
    );
  }
}
