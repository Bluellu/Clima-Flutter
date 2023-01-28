import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';

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
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var data =  await networkHelper.getData();

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LocationScreen(loadedData: data)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
