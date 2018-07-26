import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({ this.child, this.animation });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            child: child,
            height: animation.value,
            width: animation.value,
          );
        },
        child: child,
      ),
    );
  }
}
