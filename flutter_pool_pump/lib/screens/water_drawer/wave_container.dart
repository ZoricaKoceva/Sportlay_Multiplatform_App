import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math.dart' as Vector;

/*
 * Based on Nhan Cao wave demo
 * License: MIT License
 * Copyright (c) 2018 Nhan Cao
 * Source: https://github.com/nhancv/nc_flutter_util/blob/master/lib/demo5.dart
 */
class WaveContainer extends StatefulWidget {
  WaveContainer({
    Key? key,
    required this.size,
    required this.offset,
    this.color,
    this.duration = const Duration(seconds: 4),
    this.sinWidthFraction = 3,
  }) : super(key: key);

  final Size size;
  final Offset offset;
  final Color? color;
  final Duration duration;
  final int sinWidthFraction;

  @override
  State<StatefulWidget> createState() {
    return _WaveContainerState();
  }
}

class _WaveContainerState extends State<WaveContainer>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  List<Offset> animationListener = [];

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: widget.duration);

    animationController.addListener(() {
      animationListener.clear();
      for (double i = -2 - widget.offset.dx;
          i <= widget.size.width.toInt() + 2;
          i++) {
        animationListener.add(Offset(
            i.toDouble() + widget.offset.dx,
            sin(((animationController.value * 360 - i) %
                            360 *
                            Vector.degrees2Radians) *
                        widget.sinWidthFraction) *
                    8 +
                10 +
                widget.offset.dy));
      }
    });
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> _gradientColors = [
       // Color.fromRGBO(254, 193, 45, 1.0),

      // Color.fromRGBO(253, 139, 51, 1),
      // Color.fromRGBO(95, 84, 228, 1),

      Color.fromRGBO(45, 254, 230, 1.0),
    // Color.fromARGB(255, 39, 230, 227),
      Color.fromRGBO(28, 213, 252, 1.0),
    // Color.fromARGB(255, 44, 191, 217),
      Color.fromRGBO(45, 90, 254, 1.0),
    // Color.fromARGB(255, 62, 36, 251),
    //   Color.fromRGBO(0, 14, 219, 1.0),
    // Color.fromARGB(255, 65, 0, 215),
    ];
    List<double> _stops = [0.0, 0.3, 0.6];

    return Container(
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => ClipPath(
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            color: widget.color,
            decoration: widget.color == null
                ? BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: _gradientColors,
                      stops: _stops,
                    ),
                  )
                : null,
          ),
          clipper: WaveClipper(animationController.value, animationListener),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
