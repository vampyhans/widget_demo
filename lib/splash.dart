import 'package:flutter/material.dart';
import 'package:widget_demo/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child:Center(
        child: Image.asset('assets/logo.jpg'),
      ),
    );
  }
}
