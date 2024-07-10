import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double verticalPadding;
  final double fontSize;
  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.verticalPadding = 16,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child : Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(offset: const Offset(0, 15),
            blurRadius: 30,
            color: const Color(0xff666666).withOpacity(.11), 
            ),
          ]
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color:  Colors.white,
          ),
        ),
      )
    );
  }
}