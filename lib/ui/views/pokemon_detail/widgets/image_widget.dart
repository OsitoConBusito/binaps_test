import 'package:flutter/material.dart';

class FloatingImage extends StatefulWidget {
  const FloatingImage({
    super.key,
    required this.imageUrl,
    required this.imageSize,
    required this.color,
  });

  final String imageUrl;
  final double imageSize;
  final Color color;

  @override
  State<FloatingImage> createState() => _FloatingImageState();
}

class _FloatingImageState extends State<FloatingImage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween(begin: 0.0, end: 50.0).animate(_controller);

    _animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      },
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.imageSize,
          width: widget.imageSize,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: widget.imageSize - 10,
          width: widget.imageSize - 10,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Positioned(
            bottom: _animation.value,
            child: Image.network(
              widget.imageUrl,
              height: widget.imageSize,
              width: widget.imageSize,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
