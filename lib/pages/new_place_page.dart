import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thot/models/sitios.dart';
import 'package:thot/repository/firebase_api.dart';


class NewPlacePage extends StatefulWidget {
  const NewPlacePage({Key? key}) : super(key: key);

  @override
  State<NewPlacePage> createState() => _NewPlacePageState();
}

class _NewPlacePageState extends State<NewPlacePage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _lugar = TextEditingController();
  final _ciudad = TextEditingController();
  final _departamento = TextEditingController();
  final _descripcion = TextEditingController();
  final _foto = TextEditingController();
  final _ubicacion = TextEditingController();
  final _motivo = TextEditingController();

  double _rating = 3.0;

  bool _deportes = false, _vacaciones = false, _trabajo = false, _ecologico = false;


  void _showMsg(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _createPlace(Sitios sitios) async{
    var result = await _firebaseApi.createPlace(sitios);
    _showMsg(result);
    Navigator.pop(context);
  }

  void _savePlace() {
    var motivo = "";
    if (_deportes) motivo = "$motivo Deportes";
    if (_vacaciones) motivo = "$motivo Vacaciones";
    if (_trabajo) motivo = "$motivo Trabajo";
    if (_ecologico) motivo = "$motivo Ecologico";
    var sitios = Sitios("", _lugar.text, _ciudad.text, _departamento.text,
        _descripcion.text, _foto.text, _ubicacion.text, _rating, motivo);
    _createPlace(sitios);




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis viajes"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _lugar,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Lugar'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _ciudad,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Ciudad'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _departamento,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Departamento'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _descripcion,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descripcion'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _foto,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'URL Foto'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _ubicacion,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Coordenadas'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.face_retouching_natural,
                  color: Colors.greenAccent,
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                "Motivo del viaje",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Deportes"),
                      value: _deportes,
                      selected: _deportes,
                      onChanged: (bool? value) {
                        setState(() {
                          _deportes = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Vacaciones"),
                      value: _vacaciones,
                      selected: _vacaciones,
                      onChanged: (bool? value) {
                        setState(() {
                          _vacaciones = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Trabajo"),
                      value: _trabajo,
                      selected: _trabajo,
                      onChanged: (bool? value) {
                        setState(() {
                          _trabajo = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Ecologico"),
                      value: _ecologico,
                      selected: _ecologico,
                      onChanged: (bool? value) {
                        setState(() {
                          _ecologico = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () {
                  _savePlace();
                },
                child: const Text("Guardar Sitio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
