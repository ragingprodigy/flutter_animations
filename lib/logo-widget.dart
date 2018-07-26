import 'package:flutter/material.dart';

class StatelessLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}
