import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String? id, fullName, email, avatar;

  HttpStateful({
    this.id,
    this.fullName,
    this.email,
    this.avatar,
  });

  static Future<HttpStateful> connectAPI(String id) async {
    Uri url = Uri.parse('https://reqres.in/api/users/$id');

    var hasilResponse = await http.get(url);

    var data =
        (json.decode(hasilResponse.body) as Map<String, dynamic>)['data'];
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
    print(data);

    return HttpStateful(
      id: data['id'].toString(),
      fullName: data['first_name'] + " " + data['last_name'],
      email: data['email'],
      avatar: data['avatar'],
    );
  }
}
