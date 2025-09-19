import "package:flutter/material.dart";
import "package:ikommerce/ui/screen/user/home/widget/banner_widget.dart";
import "package:ikommerce/ui/screen/user/home/widget/cart_icon.dart";
import "package:ikommerce/ui/screen/user/home/widget/stuff_widget.dart";
import "package:ikommerce/ui/widgets/text_field_widget.dart";
import "package:ikommerce/utils/utils_barrel.dart";

void main(List<String> args) {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _query = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _query = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSearching = _focusNode.hasFocus;

    // hasil dummy
    final List<String> dummyItems = List.generate(20, (i) => "Produk $i");
    final List<String> filtered =
        dummyItems.where((e) => e.toLowerCase().contains(_query.toLowerCase())).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Image.asset(iconOrderHasRead, width: 24, height: 24),
          const SizedBox(width: 12),
          Image.asset(iconProfile, width: 24, height: 24),
          const SizedBox(width: 12),
        ],
        title: CustomTextField(
          controller: _searchController,
          focusNode: _focusNode,
          isCompact: true,
          fillColor: white,
          isUsingPadding: false,
          hintText: "Search",
          prefixIcons: const Icon(Icons.search, size: 16),
        ),
      ),
      body: Stack(
        children: [
          // konten utama
          SingleChildScrollView(
            child: Column(
              children: [
                const BannerSlider(
                  imageUrls: [
                    "https://www.teknikmart.com/media/wysiwyg/icon-image/jenis-mesin-potong-rumput-dan-cara-merawatnya.jpg",
                    "https://media.monotaro.id/mid01/full/Perkakas%20Tangan%2C%20Pneumatik%20%26%20Listrik/Perkakas%20Bermesin/Mesin%20Potong%20Rumput/TOTAL%20Mesin%20Potong%20Rumput%20Listrik/7eP106827266-1.jpg",
                  ],
                  primaryColor: Colors.blue,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Stuff", style: poppinsBody16Medium),
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
                  ),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const StuffWidget(
                      stuffName: "Mesin Rumput asfasfaskdfhkaljhsdlfjkaf",
                      stuffPrice: 100000,
                    );
                  },
                ),
              ],
            ),
          ),

          // FAB cart
          Positioned(
            bottom: 40,
            right: 20,
            child: CartIconWithBadge(count: 5),
          ),

          // overlay gelap + hasil pencarian
          if (isSearching) ...[
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  _focusNode.unfocus(); 
                },
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),

            // hasil pencarian
            Positioned(
              top: kToolbarHeight,
              left: 0,
              right: 0,
              child: Material(
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filtered[index]),
                      onTap: () {
                        debugPrint("Dipilih: ${filtered[index]}");
                        _focusNode.unfocus();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
