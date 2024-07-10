import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final List<Widget> widgetOptions;
  final GlobalKey<CurvedNavigationBarState> navigationKey;
  final List<String> titles;
  final List<Widget> actions;

  const NavigationMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.widgetOptions,
    required this.navigationKey, 
    required this.titles, 
    required this.actions,
  });
  // final navigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Iconsax.home,
        size: 30,
      ),
      const Icon(
        Iconsax.shop,
        size: 30,
      ),
      const Icon(Iconsax.shopping_cart, size: 30,),
      const Icon(
        Iconsax.heart,
        size: 30,
      ),
      const Icon(
        Iconsax.user,
        size: 30,
      ),
    ];
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(child: Scaffold(
          extendBody: true,
          // backgroundColor: Color(0xFFFDEBD0),
          appBar: AppBar(
            title: Text(titles[selectedIndex],
              style: const TextStyle(color: Colors.white, fontFamily: "Noto", fontSize: 18, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.blue,
            automaticallyImplyLeading: selectedIndex == 0 ? true : false,
            actions: selectedIndex == 0 ? actions : null,
            leading: selectedIndex == 0 ? IconButton( 
              icon: const Icon(Icons.menu,
                  color: Colors.white), // Use the desired icon here
              onPressed: () {},
            ) : null,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            child: CurvedNavigationBar(
              key: navigationKey,
              color: Colors.blue,
              // color: const Color(0xFFCE93D8),
              // buttonBackgroundColor: const Color(0xFF8D6E63),
              buttonBackgroundColor: const Color.fromRGBO(233, 30, 99, 1),
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              height: 50,
              index: selectedIndex,
              items: items,
              onTap: onItemTapped,
            ),
          ),
          body: Center(
            child: widgetOptions.elementAt(selectedIndex),
          ),
        )))
    );
  }
}
