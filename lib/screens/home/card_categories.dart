import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      // {"icon": Iconsax.flash, "text": "Flash Deal", "color": Colors.red},
      // {"icon": Iconsax.bill, "text": "Bill", "color": Colors.blue},
      // {"icon": Iconsax.game, "text": "Game", "color": Colors.green},
      // {"icon": Iconsax.gift, "text": "Daily Gift", "color": Colors.orange},
      // {"icon": Iconsax.discover, "text": "More", "color": Colors.purple},
      {"icon": Iconsax.flash, "text": "Flash", "color": Colors.red},
      {"icon": Iconsax.bill, "text": "ໃບບິນ", "color": Colors.blue},
      {"icon": Iconsax.game, "text": "ເກມ", "color": Colors.green},
      {"icon": Iconsax.gift, "text": "Gift", "color": Colors.orange},
      {"icon": Iconsax.discover, "text": "ເພີ່ມເຕີມ", "color": Colors.purple},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              categories.length,
              (index) => CategoryCard(
                  icon: categories[index]["icon"],
                  text: categories[index]["text"],
                  color: categories[index]["color"],
                  press: () {}))
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
    this.color = Colors.black,
  });

  final IconData icon;
  final String text;
  final Color color;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: "Noto"),
            )
          ],
        ),
      ),
    );
  }
}