import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/main_menu.dart';
import 'place_view.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

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
        body: favoritesBody()
    );
  }


  myAppbar() {
    return AppBar(
      backgroundColor: Colors.lightGreen,
      centerTitle: true,
      title: const Text('Favoritos', style: TextStyle(color: Colors.white),),
    );
  }

  favoritesBody(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection("sitios")
            .snapshots(),

        builder: (context, snapshot){
          if(snapshot.hasError) {return const Text('Un Error Ha Ocurrido!',
            style: TextStyle(fontSize: 18, color: Colors.lightGreen),);}
          if(!snapshot.hasData) return const Text('Cargando Información');
          return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              itemCount: snapshot.data!.docs.length * 2,
              itemBuilder: (context, index){
                if(index.isOdd) return const Divider();
                int indexsite = index ~/ 2;
                QueryDocumentSnapshot site = snapshot.data!.docs[indexsite];
                return myItem(site);
              }
          );
        }
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
