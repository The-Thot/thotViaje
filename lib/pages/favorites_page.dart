import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/main_menu.dart';
import 'place_view.dart';



class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);


  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int favorites = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(),
        drawer: mainMenu(context),

    );
  }


  myAppbar() {
    return AppBar(
      backgroundColor: Colors.lightGreen,
      centerTitle: true,
      title: const Text('Favoritos', style: TextStyle(color: Colors.white),),
    );
  }



  myItem(QueryDocumentSnapshot site) {
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceView(site))
        );
      },
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.lightGreen,),
      title: Text(site['lugar'], style: const TextStyle(fontSize: 20, color: Colors.lightGreen),),
      subtitle: Text('${site['ciudad']}, ${site['departamento']}', style: const TextStyle(fontSize: 18),),
    );
  }
}
