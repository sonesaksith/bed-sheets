import 'package:bed_sheets/components/Product.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    this.width = 140,
    this.aspectRation = 1.02,
    required this.product,
    super.key,
  });

  final double width, aspectRation;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRation,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ShowProductDetail(product: product),
                  //     ),
                  //   );
                  // },
                  child: Container(
                    // padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(product.images[0]),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              product.title,
              style: const TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: product.isFavourite ? Colors.pink[500] : Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Iconsax.heart, color: product.isFavourite ? Colors.white : Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}