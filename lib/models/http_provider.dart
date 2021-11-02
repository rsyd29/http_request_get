import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  void connectAPI(String id) async {
    Uri url = Uri.parse('https://reqres.in/api/users/$id');

    var hasilResponse = await http.get(url);
    _data = (json.decode(hasilResponse.body))['data'];
    notifyListeners();
    print(data);
    /***
        * Response all data.
        * JSON
        data
        id	2
        email	"janet.weaver@reqres.in"
        first_name	"Janet"
        last_name	"Weaver"
        avatar	"https://reqres.in/img/faces/2-image.jpg"
        support
        url	"https://reqres.in/#support-heading"
        text	"To keep ReqRes free, contributions towards server costs are appreciated!"

        RAW Data
        {
        "data": {
        "id": 2,
        "email": "janet.weaver@reqres.in",
        "first_name": "Janet",
        "last_name": "Weaver",
        "avatar": "https://reqres.in/img/faces/2-image.jpg"
        },
        "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
        }
        }
     */
  }
}
