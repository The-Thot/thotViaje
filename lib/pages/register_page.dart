import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thot/users/user.dart';
import 'package:thot/pages/login_page.dart';
import 'package:thot/repository/firebase_api.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseApi _firebaseApi = FirebaseApi();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  Genre? _genre = Genre.masculino;

  bool _trabajo = false;
  bool _aventura = false;
  bool _vacaciones = false;

  String buttonMsg = "Fecha de nacimiento";
  String _date = "";

  String _dataConverter(DateTime newDate){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelectDate() async{
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime(2022,1),
      firstDate: DateTime(1900,1),
      lastDate: DateTime(2022,1),
      helpText: "Fecha de nacimiento",
    );
    if(newDate != null){
      setState(() {
        _date = _dataConverter(newDate);
        buttonMsg = "Fecha de nacimiento: ${_date.toString()}";
      });
    }
  }

  void _showMsg(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(msg),
        action: SnackBarAction(
            label: "Aceptar", onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void _saveUser (User user) async{
    var result = await _firebaseApi.createUser(user);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void registerUser (User user) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString("user", jsonEncode(user));
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg = "";
    if(result == "invalid-email"){msg = "El correo electronico está mal escrito";}else
    if(result == "weak-password"){msg = "La contraseña debe tener al menos 6 digitos";}else
    if(result == "email-already-in-use"){msg = "Ya existe una cuenta con este usuario";}else
    if(result == "network-request-failed"){msg = "!ops¡ al pareer no tienes conexión";}else{
      msg = "Usuario registrado con exito";
    user.uid = result;
    _saveUser(user);
    }
    _showMsg(msg);
  }

  void _onRegisterButtonClicked() {
    setState(() {
      if(_password.text == _repPassword.text) {
        var genre = "Masculino";
        String motivo = "";

        if (_genre == Genre.femenino) {
          genre = "Femenino";
        }

        if (_trabajo) motivo = "$motivo Trabajo";
        if (_aventura) motivo = "$motivo Aventura";
        if (_vacaciones) motivo = "$motivo Vacaciones";

        var user = User("",
            genre, _name.text, _email.text, _password.text,  motivo, _date );
        registerUser(user);
      } else {
        _showMsg("Las contraseñas no son iguales");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(image: AssetImage('assets/images/Logo.png')),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nombre'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo Electrónico'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _repPassword,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirme su contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  Row(children: [
                    Expanded(
                        child: ListTile(
                            title: const Text('Masculino'),
                            leading: Radio<Genre>(
                                value: Genre.masculino,
                                groupValue: _genre,
                                onChanged: (Genre? value) {
                                  setState(() {
                                    _genre = value;
                                  });
                                }))),
                    Expanded(
                      child: ListTile(
                          title: const Text('Femenino'),
                          leading: Radio<Genre>(
                              value: Genre.femenino,
                              groupValue: _genre,
                              onChanged: (Genre? value) {
                                setState(() {
                                  _genre = value;
                                });
                              })),
                    ),
                  ]),
                  const Text('Tipos de viajes que realizas:',
                    style: TextStyle(fontSize: 20),),
                  CheckboxListTile(
                      title: const Text("Trabajo"),
                      value: _trabajo,
                      selected: _trabajo,
                      onChanged: (bool? value){
                        setState(() {
                          _trabajo = value!;
                        });
                      }
                  ),
                  CheckboxListTile(
                      title: const Text("Aventura"),
                      value: _aventura,
                      selected: _aventura,
                      onChanged: (bool? value){
                        setState(() {
                          _aventura = value!;
                        });
                      }
                  ),
                  CheckboxListTile(
                      title: const Text("Vacaciones"),
                      value: _vacaciones,
                      selected: _vacaciones,
                      onChanged: (bool? value){
                        setState(() {
                          _vacaciones = value!;
                        });
                      }
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _showSelectDate();
                    },
                    child: Text(buttonMsg),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _onRegisterButtonClicked();
                    },
                    child: const Text("Registrarse"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}