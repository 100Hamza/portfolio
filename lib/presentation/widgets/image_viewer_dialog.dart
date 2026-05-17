import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageViewerDialog extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const ImageViewerDialog({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<ImageViewerDialog> createState() => _ImageViewerDialogState();
}

class _ImageViewerDialogState extends State<ImageViewerDialog> {
  late int _current;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    if (index < 0 || index >= widget.images.length) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _current = index);
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 700;
    final hasMultiple = widget.images.length > 1;

    return KeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      autofocus: true,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) _goTo(_current - 1);
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) _goTo(_current + 1);
          if (event.logicalKey == LogicalKeyboardKey.escape) Navigator.of(context).pop();
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: isDesktop
            ? const EdgeInsets.symmetric(horizontal: 60, vertical: 40)
            : EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Dark backdrop (tap to close)
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(color: Colors.black.withValues(alpha: 0.92)),
            ),

            // Page view for swipe navigation
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {}, // prevent close when tapping image
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isDesktop
                            ? MediaQuery.of(context).size.width * 0.75
                            : double.infinity,
                        maxHeight: MediaQuery.of(context).size.height * 0.85,
                      ),
                      child: Image.network(
                        widget.images[index],
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Close button
            Positioned(
              top: isDesktop ? 16 : 48,
              right: 16,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close, color: Colors.white, size: 28),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: 0.5),
                ),
              ),
            ),

            // Left arrow (desktop only)
            if (isDesktop && hasMultiple && _current > 0)
              Positioned(
                left: 16,
                child: IconButton(
                  onPressed: () => _goTo(_current - 1),
                  icon: const Icon(Icons.chevron_left, color: Colors.white, size: 36),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withValues(alpha: 0.5),
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ),

            // Right arrow (desktop only)
            if (isDesktop && hasMultiple && _current < widget.images.length - 1)
              Positioned(
                right: 16,
                child: IconButton(
                  onPressed: () => _goTo(_current + 1),
                  icon: const Icon(Icons.chevron_right, color: Colors.white, size: 36),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withValues(alpha: 0.5),
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ),

            // Dot indicators at bottom
            if (hasMultiple)
              Positioned(
                bottom: isDesktop ? 24 : 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images.length, (i) {
                    return GestureDetector(
                      onTap: () => _goTo(i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: _current == i ? 20.0 : 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: _current == i
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.45),
                        ),
                      ),
                    );
                  }),
                ),
              ),

            // Image counter (e.g. "3 / 10")
            if (hasMultiple)
              Positioned(
                top: isDesktop ? 16 : 48,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_current + 1} / ${widget.images.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
