import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.text,
    required this.press,
  });

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: const TextStyle(
                  fontFamily: "Noto", fontSize: 16, color: Colors.black)),
          GestureDetector(
            onTap: press,
            child: const Text("ເບິ່ງເພີ່ມເຕີມ",
                style: TextStyle(
                  fontFamily: "Noto",
                  color: Colors.grey,
                )),
          )
        ],
      ),
    );
  }
}