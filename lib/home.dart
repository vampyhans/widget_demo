import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_demo/splash.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        leading: Icon(
          Icons.home_outlined,
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Splash() ));
            },
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}
