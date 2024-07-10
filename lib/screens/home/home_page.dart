import 'package:bed_sheets/components/PopularProducts.dart';
import 'package:bed_sheets/screens/home/card_categories.dart';
import 'package:bed_sheets/screens/home/section_title.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<CurvedNavigationBarState> navigationKey;
  const HomePage({super.key, required this.navigationKey});

  @override
  State<HomePage> createState() => _HomePgaeState();
}

class _HomePgaeState extends State<HomePage> {
  void _navigateToShop() {
    // Use the navigation key to set the current index to Wishlist (index 2)
    widget.navigationKey.currentState?.setPage(1);
  }
  int activeIndex = 0;
  final urlImages = [
    'assets/images/promotion.jpg',
    'assets/images/promotion.jpg',
    'assets/images/promotion.jpg',
    'assets/images/promotion.jpg',
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              SectionTitle(
                text: "ພິເສດສຳລັບທ່ານ",
                press: () {
                  _navigateToShop();
                },
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    // pageSnapping: false,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 1,
                    // reverse: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index)),
                itemCount: urlImages.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
              ),
              const SizedBox(height: 0),
              buildIndicator(),
              const SizedBox(height: 30),
              const Categories(),
              const SizedBox(height: 30),
              PopularProduct(
                onPress: _navigateToShop,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      );

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(12.0),
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: const WormEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Colors.blue,
            dotColor: Colors.black12),
      );
}
