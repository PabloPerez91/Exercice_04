import 'package:flutter/material.dart';
import 'package:exo_3/Offer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BrutMoney'),
          titleTextStyle: const TextStyle(letterSpacing: 2, color: Colors.white,fontSize: 25),
          backgroundColor: const Color.fromRGBO(51, 55, 61, 1), // status bar color
        ),
        body: const Center(
          child: Offer(title: 'BrutMoney'),
        ),
      ),
    );
  }
}