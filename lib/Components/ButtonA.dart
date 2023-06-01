import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ButtonA extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final int height;
  final int width;
  final Color color;
  final int borderSize;

  const ButtonA({Key? key, required this.onPressed, required this.buttonText, this.height = 55, this.width = 275, this.color = Colors.orange, this.borderSize = 20,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height.toDouble(),
        width: width.toDouble(),
        decoration: BoxDecoration(
            color: HexColor('#eb9634'),
            borderRadius: BorderRadius.circular(borderSize.toDouble()),
        ),
        child: Center(
          child: Text(buttonText, textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }
}
