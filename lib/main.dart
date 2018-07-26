import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

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

class ScaleAnimatedWidget extends AnimatedWidget {
  ScaleAnimatedWidget({ Key key, Animation<double> animation, this.child })
  : super(key: key, listenable: animation);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: animation.value,
        height: animation.value,
        child: this.child,
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
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    animation = Tween(begin: 0.0, end: 250.0).animate(controller)
      ..addListener(() {
        setState(() {

        });
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleAnimatedWidget(
      animation: animation,
      child: FlutterLogo(),
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
}
