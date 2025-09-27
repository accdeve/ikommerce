import 'package:flutter/material.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/typography.dart';

class AddressWidget extends StatelessWidget {
  final String address;
  final bool isSelected;
  final VoidCallback onTap;

  const AddressWidget({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: whiteFill,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(address, maxLines: 2, overflow: TextOverflow.ellipsis, style: robotoBody10Regular,)),
            isSelected ? const Icon(Icons.check_circle, color: primary) : Icon(Icons.check_circle, color: primary.withOpacity(0)),
          ],
        ),
      ),
    );
  }
}
