import 'package:flutter/material.dart';

class ImageScannerAnimation extends AnimatedWidget {
  final bool stopped;
  final double width;

  ImageScannerAnimation(this.stopped, this.width,
      {Key? key, Animation? animation})
      : super(key: key, listenable: animation!);

  Widget build(BuildContext context) {
    final Animation animation = listenable as Animation<double>;
    ;
    final scorePosition = (animation.value * 440) + 200;

    Color color1 = const Color(0x5532CD32);
    Color color2 = const Color(0x0032CD32);

    if (animation.status == AnimationStatus.reverse) {
      Color color1 = const Color(0x5532CD32);
      Color color2 = const Color(0x0032CD32);
    }

    return Positioned(
      bottom: scorePosition,
      left: 10.0,
      child: Opacity(
        opacity: (stopped) ? 0.0 : 1.0,
        child: Container(
          height: 20.0,
          width: width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(80),
              topLeft: Radius.circular(80),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(00),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.9],
              colors: [color1, color2],
            ),
          ),
        ),
      ),
    );
  }
}
