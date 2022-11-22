import 'dart:convert';

import 'package:thot/models/Result.dart';
import 'package:http/http.dart' as http;


class TripsApi{
  
  Future<Result> getTrips(String parameter) async{
    
    final response = await http.get(Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$parameter'));

    if (response.statusCode ==200){
      return Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load trips');
    }

  }
}