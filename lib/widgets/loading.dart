import 'package:flutter/material.dart';

class IsLoading extends StatelessWidget {
  const IsLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/isLoading_1.gif',
            width: 150,
            height: 150,
          ),
        ],
      ),
    );
  }
}