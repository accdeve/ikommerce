import 'package:flutter/material.dart';
import 'package:ikommerce/ui/widgets/title_widget.dart';
import 'package:ikommerce/utils/utils_barrel.dart';

class CheckoutStuffSection extends StatelessWidget {
  const CheckoutStuffSection(
      {super.key, required this.address, required this.onEditTap});
  final String address;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfffdfdfd),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8)),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                titleWidget(imagePath: iconStuff, text: "Stuff"),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2  Mesin rumput 10928402",
                      style: robotoBody12Regular,
                    ),
                    Text(formatRupiah(900000), style: robotoHeading14Bold),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2  Mesin rumput 10928402",
                      style: robotoBody12Regular,
                    ),
                    Text(formatRupiah(900000), style: robotoHeading14Bold),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: robotoHeading16Bold),
                    Text(formatRupiah(1800000), style: robotoHeading16Bold),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleWidget(imagePath: iconAddress, text: "Address"),
                    Image.asset(iconChange)
                  ],
                ),
                const SizedBox(height: 4),
                Text(address, style: robotoBody12Regular,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
