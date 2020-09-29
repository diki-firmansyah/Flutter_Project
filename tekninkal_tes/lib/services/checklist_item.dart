import 'dart:convert';

import 'package:http/http.dart' as http;

class ChecklistItem {
  _setHeaders() => {
        'Content-type' : 'application/json',
        'Accept': 'application/json',
      };

  String baseUrl = "http://18.139.50.74:8080/checklist";

  doListItem(int id) async {
    var fullurl = baseUrl + id.toString();
    return await http.get(fullurl);
  }
}
