import 'package:bed_sheets/navigationbar.dart';
import 'package:bed_sheets/screens/cart/cart.dart';
import 'package:bed_sheets/screens/home/home_page.dart';
import 'package:bed_sheets/screens/profile/profile_page.dart';
import 'package:bed_sheets/screens/favourites/wishlist_page.dart';
import 'package:bed_sheets/screens/store/store_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<CurvedNavigationBarState> _navigationKey = GlobalKey();
  int _selectedIndex = 0;

  List<Widget> _actions = [];

  final List<String> _titles = ['ຫນ້າຫຼັກ', 'ຮ້ານຄ້າ', 'ກະຕ່າ', 'ລາຍການທີ່ຢາກໄດ້', 'ໂປຣໄຟລ໌'];

  @override
  void initState() {
    super.initState();
    _actions = [
      IconButton(
        icon: const Icon(Iconsax.search_favorite, color: Colors.white),
        onPressed: () {
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
      ),
    ];
  }
  // final List<Widget> _actions = [
  //   IconButton(
  //     icon: const Icon(Iconsax.search_favorite, color: Colors.white),
  //     onPressed: () {
  //       showSearch(
  //         context: context,
  //         delegate: CustomSearchDelegate(),
  //       );
  //     },
  //   ),
  // ];

  static List<Widget> _widgetOptions(GlobalKey<CurvedNavigationBarState> navigationKey) => [
    HomePage(navigationKey: navigationKey),
    const StorePage(),
    const CartPage(),
    const WishlistPage(),
    ProfilePage(navigationKey: navigationKey),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationMenu(
      selectedIndex: _selectedIndex,
      onItemTapped: _onItemTapped,
      widgetOptions: _widgetOptions(_navigationKey),
      navigationKey: _navigationKey,
      titles: _titles,
      actions: _actions,
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Peer',
    'Watermelon',
    'Orange',
    'Blueberry',
    'Strawberries',
    'Raspberries',
  ];

  @override
  String get searchFieldLabel => 'ຄົ້ນຫາ';

  @override
  TextStyle get searchFieldStyle => const TextStyle(
    // color: Colors.red,
    fontSize: 18.0, 
    fontFamily: 'Noto'
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Iconsax.close_circle),
        onPressed: () {
          query = ''; 
        }, 
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        close(context, null);
      }, 
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        // return ListTile(
        //   title: Text(result),
        // );
        return GestureDetector(
          onTap: () {
            // print('CLICK');
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const StorePage()),
            // );
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }

}
