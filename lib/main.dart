import 'package:bed_sheets/screens/authen/login.dart';
import 'package:bed_sheets/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import '../utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
          scaffoldBackgroundColor: white,
          textTheme: Theme.of(context).textTheme.apply(
                displayColor: Colors.black,
              )
          // colorScheme: ColorScheme.fromSeed(seedColor: white),
          // useMaterial3: true,
          ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg_2.jpg"),
          fit: BoxFit.fill,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.displayLarge,
                    children: const [
                  TextSpan(
                    text: "App",
                  ),
                  TextSpan(
                    text: "Title",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ])),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: "start your day",
                fontSize: 20,
                verticalPadding: 16,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}