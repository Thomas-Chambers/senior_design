import 'package:flutter/material.dart';

class BackgroundImage1 extends StatelessWidget {
  final Widget child;
  const BackgroundImage1({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/views/widgets/background1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        child, // This allows embedding custom child widgets over the background
      ],
    );
  }
}
