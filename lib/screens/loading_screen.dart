import 'package:flutter/material.dart';
import '../services/location.dart';


const apiKey = 'a0ea109c42cd96903103df1a0beb31b3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async {

      double temperature = parsed['main']['temp'];
      int condition = parsed['weather'][0]['id'];
      String city = parsed['name'];

      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
