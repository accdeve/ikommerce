import 'dart:async';
import 'package:flutter/material.dart';

class StuffImageWidget extends StatefulWidget {
  final List<String> imageUrls;
  final Color primaryColor;

  const StuffImageWidget({
    super.key,
    required this.imageUrls,
    required this.primaryColor,
  });

  @override
  State<StuffImageWidget> createState() => _StuffImageWidgetState();
}

class _StuffImageWidgetState extends State<StuffImageWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 262,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                widget.imageUrls[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),

          Positioned(
            bottom: 12,
            right: MediaQuery.maybeOf(context)!.size.width / 2 - 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "${_currentIndex + 1}/${widget.imageUrls.length}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
