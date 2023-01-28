import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String url;

  NetworkHelper(this.url);

  void getData() async {
    http.Response response =  await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey')
    );

    if (response.statusCode == 200) {
      String data = response.body;

      var parsed = jsonDecode(data);

    }

}