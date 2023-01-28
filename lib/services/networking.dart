import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String url;

  NetworkHelper(this.url);


  /* Retrieve data from given API url, and parse it into an object */
  Future getData() async {
    http.Response response = await http.get(
        Uri.parse(url)
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
    else {
      print(response.statusCode);
    }
  }

}