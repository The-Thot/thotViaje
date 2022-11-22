import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thot/firebase_options.dart';
import 'package:thot/pages/home_page.dart';
import 'package:thot/pages/login_page.dart';
import 'package:thot/pages/places_list.dart';
import 'package:thot/pages/register_page.dart';
import 'package:thot/pages/search_trip_page.dart';
import 'package:thot/pages/splash_page.dart';
import 'firebase_options.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viajanthot',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale("en", "US"),
        Locale("es", "CO"),
      ],
      theme: ThemeData(

        primarySwatch: Colors.lightGreen,
      ),
      home: const SearchTripPage(),
    );
  }
}