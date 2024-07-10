import 'package:bed_sheets/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartProducts = [
    {
      'name': 'Queen Comforter Set 7 Piece Bed',
      'description': "ຕຽງທີ່ຫຼູຫຼານີ້...",
      'price': 89.99,
      'imageUrl': 'assets/images/bed/bed_1.png',
      'category': 'ຕຽງ',
      'active': false,
      'quantity': 1,
    },
    {
      'name': 'Fitted Sheet and Shams',
      'description': "ຕຽງທີ່ຫຼູຫຼານີ້...",
      'price': 69.99,
      'imageUrl': 'assets/images/bed/bed_2.png',
      'category': 'ຕຽງ',
      'active': false,
      'quantity': 1,
    },
    {
      'name': 'DUVET COVER SETS XB',
      'description': 'ຊຸດຝາປິດ Duvet ມີສີດ...',
      'price': 8.99,
      'imageUrl': 'assets/images/cover/cover-4.png',
      'category': 'ຜ້າປູບ່ອນ',
      'active': false,
      'quantity': 1,
    },
    {
      'name': 'DUVET COVER SETS XB',
      'description': 'ຊຸດຝາປິດ Duvet ມີສີດ...',
      'price': 8.99,
      'imageUrl': 'assets/images/cover/cover-11.png',
      'category': 'ຜ້າປູບ່ອນ',
      'active': false,
      'quantity': 1,
    },
    {
      'name': 'DUVET COVER SETS XB',
      'description': 'ຊຸດຝາປິດ Duvet ມີສີດ...',
      'price': 8.99,
      'imageUrl': 'assets/images/cover/cover-10.png',
      'category': 'ຜ້າປູບ່ອນ',
      'active': false,
      'quantity': 1,
    },
    {
      'name': 'DUVET COVER SETS XB',
      'description': 'ຊຸດຝາປິດ Duvet ມີສີດ...',
      'price': 8.99,
      'imageUrl': 'assets/images/cover/cover-8.png',
      'category': 'ຜ້າປູບ່ອນ',
      'active': false,
      'quantity': 1,
    },
  ];

  // Function to increase quantity
  void increaseQuantity(int index) {
    setState(() {
      cartProducts[index]['quantity']++;
    });
  }

  // Function to decrease quantity
  void decreaseQuantity(int index) {
    setState(() {
      if (cartProducts[index]['quantity'] > 1) {
        cartProducts[index]['quantity']--;
      } else {
        cartProducts.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate total amount
    double totalAmount = cartProducts.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));

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
                                Text(
                                  'ລາຄາ: \$${product['price']} \nຈໍານວນ: ${product['quantity']}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Noto",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => decreaseQuantity(index),
                                  icon: const Icon(
                                    Iconsax.minus_cirlce,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  // icon: const Icon(Icons.remove_circle_outline),
                                ),
                                Text(
                                  '${product['quantity']}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Noto",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => increaseQuantity(index),
                                  icon: const Icon(
                                    Iconsax.add_circle,
                                    size: 20,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        // color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ລວມ: \$${totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors
                      .blue, // You can choose a color that suits your app's theme
                  fontFamily:
                      "Noto", // Assuming "Noto" is available in your app's fonts
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('buy');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.pink[500],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Noto",
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
