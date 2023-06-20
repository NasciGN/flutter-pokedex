import 'dart:convert';

import 'package:http/http.dart' as http;

String baseUrl = 'https://api.3geonames.org/?randomland=DE&json=1';

Future<List<String>> fetchLocation() async {
  String latitude = '';
  String longitude = '';
  List<String> location = [];

  final http.Response response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    var loc = data["nearest"];
    latitude = loc['latt'];
    longitude = loc['longt'];

    location.add(latitude);
    location.add(longitude);

    print(location.toList().join(', '));
  }

  return location;
}
