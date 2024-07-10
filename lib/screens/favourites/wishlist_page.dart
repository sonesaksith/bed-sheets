import 'package:bed_sheets/widgets/no_data.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final List<Map<String, dynamic>> cartProducts = [
    {
      'name': 'Queen Comforter Set 7 Piece Bed',
      'description': "ຕຽງທີ່ຫຼູຫຼານີ້...", 
      'price': 89.99,
      'imageUrl': 'assets/images/bed/bed_1.png',
      'category': 'ຕຽງ',
      'active': true,
      'quantity': 1,
      'rating': 4.1,
    },
    {
      'name': 'Fitted Sheet and Shams',
      'description': "ຕຽງທີ່ຫຼູຫຼານີ້...",
      'price': 69.99,
      'imageUrl': 'assets/images/bed/bed_2.png',
      'category': 'ຕຽງ',
      'active': true,
      'quantity': 1,
      'rating': 4.1,
    },
    {
      'name': 'DUVET COVER SETS XB',
      'description': 'ຊຸດຝາປິດ Duvet ມີສີດ...',
      'price': 8.99,
      'imageUrl': 'assets/images/cover/cover-4.png',
      'category': 'ຜ້າປູບ່ອນ',
      'active': true,
      'quantity': 1,
      'rating': 4.1,
    },
    {
      'name': 'DUVET COVER SETS XB',
      'description': 'ຊຸດຝາປິດ Duvet ມີສີດ...',
      'price': 8.99,
      'imageUrl': 'assets/images/cover/cover-11.png',
      'category': 'ຜ້າປູບ່ອນ',
      'active': true,
      'quantity': 1,
      'rating': 4.1,
    },
    {
      'name': 'DUVET COVER SETS XB',
      'description': 'ຊຸດຝາປິດ Duvet ມີສີດ...',
      'price': 8.99,
      'imageUrl': 'assets/images/cover/cover-10.png',
      'category': 'ຜ້າປູບ່ອນ',
      'active': true,
      'quantity': 1,
      'rating': 4.1,
    },
    {
      'name': 'DUVET COVER SETS XB',
      'description': 'ຊຸດຝາປິດ Duvet ມີສີດ...',
      'price': 8.99,
      'imageUrl': 'assets/images/cover/cover-8.png',
      'category': 'ຜ້າປູບ່ອນ',
      'active': true,
      'quantity': 1,
      'rating': 4.1,
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      cartProducts[index]['active'] = !(cartProducts[index]['active'] ?? true);
      if (cartProducts[index]['active'] == false) {
        cartProducts.removeAt(index);
      } 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cartProducts.isEmpty
          ? const NoDataWidget(message: 'ບໍ່ມີຂໍ້ມູນ')
          : ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];
                return Card(
                  // color: Colors.blue.shade50,
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                            child: Image.asset(
                              product['imageUrl'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  product['name'],
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "Noto",
                                  ),
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    text:
                                        'ລາຄາ: \$${product['price']} \nRating: ',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Noto",
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${product['rating']}',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "Noto",
                                          fontSize: 16
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 6.0,
                              bottom: 6.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () => toggleFavorite(index),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: product['active'] ?? true
                                      ? Colors.red
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    product['active'] ?? true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
