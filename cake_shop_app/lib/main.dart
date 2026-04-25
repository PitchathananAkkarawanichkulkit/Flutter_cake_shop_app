import 'package:cake_shop_app/views/splash_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlutterCakeShopApp());
}

class FlutterCakeShopApp extends StatefulWidget {
  const FlutterCakeShopApp({super.key});

  @override
  State<FlutterCakeShopApp> createState() => _FlutterCakeShopAppState();
}

class _FlutterCakeShopAppState extends State<FlutterCakeShopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.promptTextTheme(
          Theme.of(context).textTheme
          ),
      ),
    );
  }
}
