import 'package:bed_sheets/screens/authen/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState> navigationKey;

  const ProfilePage({super.key, required this.navigationKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/profile/kimbup.jpeg'),
                  ),
                  Positioned(
                    bottom: -6,
                    right: -6,
                    child: IconButton(
                      icon: const Icon(
                        Iconsax.edit4,
                        size: 25,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // Add functionality to edit profile
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'ສອນສັກສິດ ບຸດສະດາຈິດ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Noto",
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'sonesaksithboudsadachit@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: "Noto",
                ),
              ),
              const SizedBox(height: 20),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Text(
              //     'My name is Sonsaksith, a 22-year-old programmer hailing from Laos. I currently work at a tech company, where I bring my passion for technology and coding to life every day.',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontFamily: "Noto",
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.qr_code),
                      title: const Text('QR Code', style: TextStyle(fontFamily: "Noto"),),
                      onTap: () {
                        // Add functionality for QR Code
                      },
                    ),
                    ListTile(
                      leading: const Icon(Iconsax.shield_tick),
                      title: const Text('ບໍລິການ ແລະ ນະໂຍບາຍ', style: TextStyle(fontFamily: "Noto"),),
                      onTap: () {
                        // Add functionality for Policy
                      },
                    ),
                    ListTile(
                      leading: const Icon(Iconsax.box_time4),
                      title: const Text('ປະຫວັດການຊື້', style: TextStyle(fontFamily: "Noto"),),
                      onTap: () {
                        // Add functionality for History
                      },
                    ),
                    ListTile(
                      leading: const Icon(Iconsax.logout_14),
                      title: const Text(
                        'ອອກ​ຈາກ​ລະ​ບົບ',
                        style: TextStyle(color: Colors.red, fontFamily: "Noto"),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text("ທ່ານແນ່ໃຈບໍ່ວ່າຕ້ອງການອອກຈາກລະບົບ?", textAlign: TextAlign.center, style: TextStyle(fontFamily: "Noto", fontSize: 16),),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("ຍົກເລີກ", style: TextStyle(color: Colors.blue, fontFamily: "Noto"),),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                  },
                                ),
                                TextButton(
                                  child: const Text("ອອກ​ຈາກ​ລະ​ບົບ", style: TextStyle(color: Colors.red, fontFamily: "Noto"),),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LoginPage()),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(
      navigationKey: GlobalKey<CurvedNavigationBarState>(),
    ),
  ));
}
