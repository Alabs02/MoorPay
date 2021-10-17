import 'package:flutter/material.dart';
import 'package:moorpay/constants/colors_constant.dart';
import 'package:moorpay/screens/home_screen.dart';

void main() => runApp(MoPay());

class MoPay extends StatelessWidget {
  const MoPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
