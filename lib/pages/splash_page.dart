

import 'package:flutter/material.dart';
import 'package:thot/pages/login_page.dart';

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
      Navigator.pushReplacement (context,MaterialPageRoute(builder: (context) => const LoginPage()));
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