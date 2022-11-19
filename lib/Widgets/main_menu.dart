import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/places_list.dart';
import '../pages/home_page.dart';
import '../pages/favorites_page.dart';

Widget mainMenu(BuildContext context) {
  return Drawer(
    shape: const RoundedRectangleBorder(),
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child:  Column(
            children: const [
              Text('Visita Colombia con thoT',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen,
                  fontSize: 20)),
            Text('',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen,
                    fontSize: 20)),
            ]
            ),
          ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          iconColor: Colors.lightGreen,
          title: const Text('Inicio', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.home),
          textColor: Colors.lightGreen,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
          },
        ),
        const SizedBox(
          height: 3,
        ),
        ListTile(
          iconColor: Colors.lightGreen,
          title: const Text('Lugares', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.place),
          textColor: Colors.lightGreen,
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> const Places()));
          },
        ),
        const SizedBox(
          height: 3,
        ),

        ListTile(
          iconColor: Colors.lightGreen,
          title: const Text('Mis Favoritos', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.star),
          textColor: Colors.lightGreen,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Favorites()));
          },
        ),
        const SizedBox(
        height: 3,
        ),







        ListTile(
          iconColor: Colors.lightGreen,
          title: const Text('Cerrar Sesión', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.logout_outlined),
          textColor: Colors.lightGreen,
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  const LoginPage()),
                    (route) => false);
          },
        ),
        const SizedBox(
          height: 3,
        ),
      ],
    ),
  );
}