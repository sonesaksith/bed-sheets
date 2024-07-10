import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String message;

  // const NoDataWidget({super.key, this.message = 'ບໍ່ມີຜະລິດຕະພັນທີ່ມີຢູ່'});
  const NoDataWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_items.gif',
            width: 150,
            height: 150,
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Noto",
            ),
          ),
        ],
      ),
    );
  }
}