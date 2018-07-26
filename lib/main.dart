import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'transitions.dart';
import 'logo-widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Animations Test',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Animations'),
        ),
        body: LogoWidget(),
      ),
    );
  }
}

class LogoWidget extends StatefulWidget {
  @override
  _LogoWidgetState createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 350.0).animate(curve);

    animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(child: StatelessLogoWidget(), animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
}
