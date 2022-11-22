import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thot/pages/new_place_page.dart';
import '../widgets/main_menu.dart';
import 'place_view.dart';

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}



class _PlacesState extends State<Places> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares'),
      ),
      drawer: mainMenu(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("sitios")
          .snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) return const Text('Loading');
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (contest, index){
              QueryDocumentSnapshot viaje = snapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  title: Text(viaje['lugar']),
                  subtitle: Text(viaje['ciudad']),
                )
              );
            },
          );
        },
      )
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPlacePage()));
      },
      tooltip: 'New trip',
    child: const Icon(Icons.add)
      ),
    );
  }
}