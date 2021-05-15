import 'dart:convert';
import 'package:http/http.dart';

class Covid {
  List location;
  int death;
  int recovered;
  int active;
  String error;

  Covid();

  Future<void> getGlobal() async {
    try {
      Response response = await get('https://api.covid19api.com/summary');
      Map data = jsonDecode(response.body);
      death = data['Global']['TotalDeaths'];
      recovered = data['Global']['TotalRecovered'];
      active = data['Global']['TotalConfirmed'];
      error = '';
    } 
    catch (e) {
      print(e);
      recovered = 0;
      death = 0;
      active = 0;
      error = "Something Wrong";
    }
  }

  Future<void> getCountries() async {
    try {
      Response response = await get('https://api.covid19api.com/summary');
      Map data = jsonDecode(response.body);
      location = data['Countries'];
      error = '';
    } 
    catch (e) {
      print(e);
      recovered = 0;
      death = 0;
      active = 0;
      error = "Something Wrong";
    }
  }
}
