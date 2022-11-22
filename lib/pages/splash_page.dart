

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thot/pages/login_page.dart';
import 'package:thot/pages/places_list.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    _closeSplash();
    super.initState();
  }

  Future<void> _closeSplash () async{
    Future.delayed(const Duration(seconds: 2), () async{
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        Navigator.pushReplacement (context,MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        Navigator.pushReplacement (context,MaterialPageRoute(builder: (context) => const Home()));
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Image(image: AssetImage('assets/images/Logo.png'),
          ),
        )
    );
  }
}