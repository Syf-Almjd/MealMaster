import 'package:flutter/material.dart';

class EachPage extends StatelessWidget{
  final String message;
  final String titleMessage;
  final String image;

  const EachPage(this.titleMessage, this.message, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // add this
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                  child: Center(
                child: Text(
                  titleMessage,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              )),
              Image.asset(
                image,
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                    child: Text(
                      message,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
