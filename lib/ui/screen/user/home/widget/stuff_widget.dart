import 'package:flutter/material.dart';
import 'package:ikommerce/utils/extensions.dart';
import 'package:ikommerce/utils/typography.dart';
class StuffWidget extends StatelessWidget {
  const StuffWidget({
    super.key,
    required this.stuffName,
    required this.stuffPrice,
    required this.isAdmin,
    required this.isDeleteMode,
    required this.isSelected,
    required this.onSelected,
  });

  final String stuffName;
  final int stuffPrice;
  final bool isAdmin;
  final bool isDeleteMode;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isDeleteMode) {
          onSelected(); // toggle pilihan
        } else {
          if (isAdmin) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (_) => const EditStuffPage()),
            // );
          } else {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (_) => const DetailStuffPage()),
            // );
          }
        }
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xfffefefe),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Gambar + overlay
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    child: Image.network(
                      "https://www.teknikmart.com/media/wysiwyg/icon-image/jenis-mesin-potong-rumput-dan-cara-merawatnya.jpg",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  if (isAdmin && !isDeleteMode)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, size: 16, color: Colors.blue),
                      ),
                    ),

                  if (isDeleteMode)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Checkbox(
                        value: isSelected,
                        onChanged: (_) => onSelected(),
                      ),
                    ),
                ],
              ),
            ),

            /// Teks
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(shortenText(stuffName), style: robotoBody12Regular),
                    const SizedBox(height: 8),
                    Text(formatRupiah(stuffPrice), style: robotoBody12Bold),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
