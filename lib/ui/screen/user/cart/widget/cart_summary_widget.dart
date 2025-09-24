import 'package:flutter/material.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/utils/typography.dart';

class CartSummaryWidget extends StatelessWidget {
  final String chosenText;
  final String total;

  const CartSummaryWidget({
    super.key,
    required this.chosenText,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Chosen + Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(chosenText, style: robotoBody12Regular,),
            Text(
              total,
              style: robotoHeading16Bold
            ),
          ],
        ),
        SizedBox(height: 4),
        CustomButton.contained(
          label: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}