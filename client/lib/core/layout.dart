import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget widget;

  const Layout({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
              child: widget),
        ),
      );
    });
  }
}
