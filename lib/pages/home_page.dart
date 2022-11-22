import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thot/pages/favorites_page.dart';
import 'package:thot/pages/place_view.dart';
import 'package:thot/pages/places_list.dart';
import '../users/user.dart';
import '../Widgets/main_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: myBody(),
      drawer: mainMenu(context),
    );
  }

  myAppbar() {
    return AppBar(
      backgroundColor: Colors.lightGreen,
      centerTitle: true,
      title: const Text('Home', style: TextStyle(color: Colors.white),),
    );
  }

  myBody() {
    return const Center(
      child: Text('ThoT para Colombia', style: TextStyle(fontSize: 25),),
    );
  }
}
