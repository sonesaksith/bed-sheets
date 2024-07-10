// ignore_for_file: avoid_print

import 'package:bed_sheets/components/ProductCard.dart';
import 'package:bed_sheets/screens/store/show_product_detail.dart';
import 'package:bed_sheets/widgets/loading.dart';
import 'package:bed_sheets/widgets/no_data.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final List<String> categories = [
    "ທັງໝົດ",
    "ຜ້າປູບ່ອນ",
    "ຕຽງ",
    "ຜ້າຫົ່ມ",
    "ຜ້າ",
    "ຂຸດເຄື່ອງນອນ",
    "ປວກໝອນ"
  ];
  // final List<String> categories = ["All Bedding", "Duvet Cover" "Shams", "Quilts", "Comforters", "Sheet sets", "Pillowcases"];
  String selectedCategory = "ທັງໝົດ";
  List<Product> filteredProducts = [];
  bool _isLoading = false;

  @override
  void initState() {
    // filteredProducts = products;
    filterProducts(selectedCategory);
    super.initState();
  }

  Future<List<Product>> _fetchProducts(String category) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (category == "ທັງໝົດ") {
      return products;
    } else {
      return products.where((product) => product.category == category).toList();
    }
  }

  void filterProducts(String category) async {
    selectedCategory = category;
    setState(() {
      _isLoading = true;
    });

    filteredProducts = await _fetchProducts(category);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                hintText: 'ຄົ້ນຫາ...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: const TextStyle(fontFamily: 'Noto'),
              onChanged: (value) {
                // Implement your search logic here
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            height: 45,
            decoration: const BoxDecoration(
              // color: Color(0xffeceff1),
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    filterProducts(category);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 0.0),
                    decoration: BoxDecoration(
                      color: selectedCategory == category
                          ? Colors.pink[500]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: selectedCategory == category
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Noto",
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _isLoading
                  ? const Center(
                      child: IsLoading(),
                    )
                  : filteredProducts.isEmpty
                      ? const NoDataWidget(message: 'ບໍ່ມີຂໍ້ມູນ')
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            return ProductCard(product: product);
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowProductDetail(product: product),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: InkWell(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ShowProductDetail(product: product),
                    //     ),
                    //   );
                    // },
                    child: Image.asset(
                      product.imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        print('heart');
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: !product.isFavourite
                              ? Colors.pink[500]
                              : Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons
                              .favorite, // or Iconsax.heart if you are using the Iconsax package
                          color: product.isFavourite ? Colors.white : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "Noto",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: "Noto",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      print('cart');
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.pink[500],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
