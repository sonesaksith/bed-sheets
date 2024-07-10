import 'package:bed_sheets/components/ProductCard.dart';
import 'package:flutter/material.dart';

class ShowProductDetail extends StatelessWidget {
  final Product product;

  const ShowProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          product.name,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Noto",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 96), // Add padding to the bottom
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Noto",
                        letterSpacing: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
                  child: Text(
                    'ລາຄາ: \$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontFamily: "Noto"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  child: Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, fontFamily: "Noto"),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} ເພີ່ມເຂົ້າກະຕ່າແລ້ວ', style: const TextStyle(fontFamily: "Noto"),))
                );
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add_shopping_cart, color: Colors.white,),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 86,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} ເພີ່ມເຂົ້າລາຍການທີ່ມັກແລ້ວ', style: const TextStyle(fontFamily: "Noto"),))
                );
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.favorite, color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
