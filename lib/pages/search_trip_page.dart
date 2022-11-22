import 'package:flutter/material.dart';
import 'package:thot/Widgets/main_menu.dart';
import 'package:thot/models/result.dart';
import 'package:thot/repository/trips_api.dart';

class SearchTripPage extends StatefulWidget {
  const SearchTripPage({Key? key}) : super(key: key);

  @override
  State<SearchTripPage> createState() => _SearchTripPageState();
}

class _SearchTripPageState extends State<SearchTripPage> {
  final _parametro = TextEditingController();

  List<Predictions> listTrips = <Predictions>[];
  TripsApi _tripsApi = TripsApi();

  Future _searchTrip() async{
    Result resultFuture = (await _tripsApi.getTrips(_parametro.text)) as Result; Result;
    setState(() {
      resultFuture.predictions?.forEach(
              (element) {
                listTrips.add(element);
              }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Google Api Maps"),
      ),
      drawer: mainMenu(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            children:[
            TextFormField(
              controller: _parametro,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite un Lugar o sitio"),
              keyboardType: TextInputType.text,
              ),
            const SizedBox(
              height: 16.0,
            ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: (){
                  _searchTrip();
                },
                child: const Text('Buscar Lugares'),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: listTrips.length,
                      itemBuilder: (BuildContext context, int index){
                        Predictions trip = listTrips[index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              trip.description??"",
                              errorBuilder: (BuildContext context, Object exception, StrackTrace){
                                return const Image(image: AssetImage('assets/images/Logo.png'),
                              );
                            },
                          ),
                            title: Text(trip.description?? "No hay considencias"),
                            subtitle: Text(trip.reference?? "No hay informacion"),
                        ),
                        );
                      },
                   ),
              ),
            ]),
        ),
      ),
    );
  }
}
