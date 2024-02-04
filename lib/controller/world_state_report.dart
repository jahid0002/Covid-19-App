import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:covid19/model/woldStateModel.dart';

class WorldStateReport {
  Future<WorldStateModel> worldStateReport() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
