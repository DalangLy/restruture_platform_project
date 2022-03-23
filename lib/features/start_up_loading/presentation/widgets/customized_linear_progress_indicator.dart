import 'package:flutter/material.dart';

class CustomizedLinearProgressIndicator extends StatelessWidget {
  final double value;
  const CustomizedLinearProgressIndicator({Key? key, required this.value,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      height: 5,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: LinearProgressIndicator(
          value: value,
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
          backgroundColor: const Color(0xffD6D6D6),
        ),
      ),
    );
  }
}
