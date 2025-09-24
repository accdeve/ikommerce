import 'package:flutter/material.dart';
import 'package:ikommerce/utils/extensions.dart';
import 'package:ikommerce/utils/typography.dart';

class StuffWidget extends StatelessWidget {
  const StuffWidget({
    super.key,
    required this.stuffName,
    required this.stuffPrice,
  });

  final String stuffName;
  final int stuffPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // gambar
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.network(
                "https://www.teknikmart.com/media/wysiwyg/icon-image/jenis-mesin-potong-rumput-dan-cara-merawatnya.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          ///teks
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
    );
  }
}
