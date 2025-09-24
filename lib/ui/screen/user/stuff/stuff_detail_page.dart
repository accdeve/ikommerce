import "package:flutter/material.dart";
import "package:ikommerce/ui/screen/user/stuff/widget/stuff_image_widget.dart";
import "package:ikommerce/ui/widgets/button_widget.dart";
import "package:ikommerce/ui/widgets/title_widget.dart";
import "package:ikommerce/utils/typography.dart";
import "package:ikommerce/utils/utils_barrel.dart";

void main(List<String> args) {
  runApp(MaterialApp(
    home: DetailPage(
      namaBarang: "Mesin Bubut",
      harga: 100000,
      jumlah: 2,
      description:
          "Mesin bubut mantap keren sekali untuk sekali lihat lalu makan ikan",
      imageUrls: [
        "https://www.teknikmart.com/media/wysiwyg/icon-image/jenis-mesin-potong-rumput-dan-cara-merawatnya.jpg",
        "https://media.monotaro.id/mid01/full/Perkakas%20Tangan%2C%20Pneumatik%20%26%20Listrik/Perkakas%20Bermesin/Mesin%20Potong%20Rumput/TOTAL%20Mesin%20Potong%20Rumput%20Listrik/7eP106827266-1.jpg",
      ],
    ),
  ));
}

class DetailPage extends StatefulWidget {
  final String namaBarang;
  final int harga;
  final int jumlah;
  final String description;
  final List<String> imageUrls;

  const DetailPage({
    super.key,
    required this.namaBarang,
    required this.harga,
    required this.jumlah,
    required this.description,
    required this.imageUrls,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      StuffImageWidget(
                        imageUrls: widget.imageUrls,
                        primaryColor: Colors.blue,
                      ),

                      // 🔽 Icon Back & Cart
                      Positioned(
                        top: 16,
                        left: 16,
                        right: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: white.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    size: 12,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),

                            // Icon Cart
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  iconCart,
                                  width: 12,
                                  height: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: MediaQuery.maybeOf(context)!.size.height * 0.55,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: stroke, width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: whiteFill,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔽 Nama Barang
                          Text(
                            widget.namaBarang,
                            style: robotoBody16Regular,
                          ),
                          const SizedBox(height: 8),

                          // 🔽 Harga & Jumlah
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              titleWidget(
                                imagePath: iconStuff,
                                text: formatRupiah(widget.harga),
                                textStyle: robotoHeading20Bold,
                              ),
                              Text(
                                "Tersisa ${widget.jumlah}",
                                style: robotoBody12Regular,
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(
                            color: stroke,
                            thickness: 1,
                          ),
                          const SizedBox(height: 8),

                          // 🔽 Description
                          titleWidget(
                              imagePath: iconDescription, text: "Description"),
                          const SizedBox(height: 8),
                          Text(
                            widget.description,
                            style: robotoBody14Light,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton.contained(
          label: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
