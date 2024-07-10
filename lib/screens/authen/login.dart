import 'package:bed_sheets/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      // print('Username: $username');
      // print('Password: $password');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // Show error message if username or password is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Username or Password cannot be empty.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    // appBar: AppBar(
      //   title: const Text(
      //     'Login',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //       fontFamily: 'Roboto',
      //       letterSpacing: 1.5,
      //     ),
      //   ),
      //   backgroundColor: Colors.blue,
      //   automaticallyImplyLeading: false,
      // ),
    body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login.png'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.3), // Optional: Add semi-transparent overlay
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'ເບີ​ໂທລະ​ສັບ',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Noto",
                    ),
                    prefixIcon: const Icon(
                      Iconsax.user,
                      color: Colors.black,
                    ),
                    // enabledBorder: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 20.0),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'ລະຫັດຜ່ານ',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Noto",
                    ),
                    prefixIcon: const Icon(
                      Iconsax.lock,
                      color: Colors.black,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 20.0),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  // margin: const EdgeInsets.symmetric(horizontal: 40.0),
                  // padding: const EdgeInsets.symmetric(vertical: 15.0),
                  height: 55.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.lightBlue.shade50
                    ),
                    onPressed: _login,
                    child: const Text('ເຂົ້າ​ສູ່​ລະ​ບົບ', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Noto",
                      color: Colors.black
                    ),),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'ເຂົ້າຊົມໂດຍບໍ່ຕ້ອງເຂົ້າສູ່ລະບົບ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Noto"
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
