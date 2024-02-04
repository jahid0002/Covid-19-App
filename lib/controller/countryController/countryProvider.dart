import 'dart:convert';



import 'package:http/http.dart' as http;

class CountryControllers  {
  /// Hit api///
 

  Future<List<dynamic>> getCountries() async {
    var data;
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString()); 
     
      return data;
      
    } else {
      throw Exception('error');
    }
  }

  /// Text Controller;

 
}
