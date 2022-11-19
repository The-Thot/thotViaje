import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:thot/pages/new_place_page.dart';
import '../Widgets/main_menu.dart';
import 'package:thot/models/sitios.dart';


// ignore: must_be_immutable
class PlaceView extends StatefulWidget {
  late QueryDocumentSnapshot site;
  PlaceView(this.site, {super.key});

  @override
  State<PlaceView> createState() => _PlaceViewState();
}

class _PlaceViewState extends State<PlaceView> {
  double _rating = 3.0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: placeBody(),
      drawer: mainMenu(context),
    );
  }

  myAppbar() {
    return AppBar(
      backgroundColor: Colors.lightGreen,
      centerTitle: true,
      title: const Text(
        'Sitio Turístico',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  placeBody() {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FadeInImage(
              fadeInDuration: const Duration(seconds: 3),
              placeholder: const NetworkImage(
                  'https://acegif.com/wp-content/uploads/loading-11.gif'),
              image: NetworkImage(
                  widget.site['foto'])),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Información:',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Accordion(
          headerBackgroundColor: Colors.lightGreen,
          contentBorderColor: Colors.lightGreen,
          openAndCloseAnimation: Accordion.sectionAnimation,
          contentHorizontalPadding: 10,
          children: [
            AccordionSection(
                header: const Text('Destino', style: TextStyle(fontSize: 18, color: Colors.white),),
                content: Text(widget.site['lugar'])),
            AccordionSection(
                header: const Text('Descripción', style: TextStyle(fontSize: 18, color: Colors.white),),
                content: Text(widget.site['descripcion'])),
            AccordionSection(
                header: const Text('Ciudad', style: TextStyle(fontSize: 18, color: Colors.white),),
                content: Text(widget.site['ciudad'])
            ),
            AccordionSection(
                header: const Text('Departamento', style: TextStyle(fontSize: 18, color: Colors.white),),
                content: Text(widget.site['departamento'])
            ),
            AccordionSection(
                header: const Text('Coordenadas de Ubicacion', style: TextStyle(fontSize: 18, color: Colors.white),),
                content: Text(widget.site['ubicacion'])
            ),

        ]),
        const SizedBox(
          height: 15,
        ),

        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.face,
            color: Colors.greenAccent,
          ),
          onRatingUpdate: (rating) {
            _rating = rating;
          },
        ),



        TextButton(
            onPressed: (){},
            child: const Text('Ver en Google Maps', style: TextStyle(fontSize: 18, color: Colors.black),)
        )
      ],

    ));
  }
}
