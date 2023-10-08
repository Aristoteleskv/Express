import 'package:flutter/material.dart';

class ButtonOfNumPad extends StatelessWidget {
  const ButtonOfNumPad({Key? key, required this.num, this.onPressed})
      : super(key: key);

  final String num;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: FloatingActionButton.extended(
        heroTag: num,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        splashColor: Colors.orange,
        onPressed: onPressed,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black45, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        label: Text(
          num,
          style: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
        ),
      ),
    );
  }
}

class ButtonOfTxtPad extends StatelessWidget {
  const ButtonOfTxtPad({Key? key, required this.num, this.onPressed})
      : super(key: key);

  final String num;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FloatingActionButton.extended(
        heroTag: num,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        splashColor: Colors.orange,
        onPressed: onPressed,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black54, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        label: Text(
          num,
          style: const TextStyle(color: Colors.black54, fontSize: 18.0),
        ),
      ),
    );
  }
}
