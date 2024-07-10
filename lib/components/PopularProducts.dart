// ignore_for_file: file_names
import 'package:bed_sheets/components/Product.dart';
import 'package:bed_sheets/screens/home/product_card.dart';
import 'package:bed_sheets/screens/home/section_title.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  final VoidCallback onPress;
  const PopularProduct({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "ສີ້ນຄ້າຍອດນິຍົມ",
          press: onPress,
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(demoProducts.length,
                  (index) => ProductCard(product: demoProducts[index],
                ),
              ),
              const SizedBox(width: 20,)
            ],
          ),
        ),
      ],
    );
  }
}