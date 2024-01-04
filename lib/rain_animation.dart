import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rain extends StatefulWidget {
  final double height;
  final double width;

  const Rain({super.key, required this.height, required this.width});

  @override
  State<Rain> createState() => _RainState();
}

class _RainState extends State<Rain> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late double dx;
  late double dz;
  late int duration;
  late double dropHeight;

  @override
  void initState() {
    super.initState();
    dx = (Random().nextInt(100)) / 100 * widget.width;
    duration = Random().nextInt(2000) + 500;
    dz = Random().nextInt(100) * 1.0;
    dropHeight = Random().nextInt(10) * 1.0;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: duration));
    _animation = Tween<double>(begin: 0, end: widget.height)
        .animate(_animationController);
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              return Transform(
                transform: Matrix4.identity()..translate(dx,_animation.value, 0),
                child: Drop(height: dropHeight,),
              );
            },
          )
        ],
      ),
    );
  }
}

class Drop extends StatelessWidget {
  final double height;
  const Drop({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: height / 3,
      decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.circular(3)),
    );
  }
}
