import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final loadedData;
  LocationScreen({@required this.loadedData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  double temperature;
  String weatherIcon;
  String city;
  String message;

  void updateUI (dynamic weatherData) {
    setState(() {

      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        message = 'Unable to get location data';
        city = '';
        return;
      }

      temperature = weatherData['main']['temp'];

      int condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      city = weatherData['name'];

      message = weather.getMessage(temperature.toInt());
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.loadedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      dynamic weatherData = await weather.getUpdatedWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      String cityName;

                      cityName = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CityScreen())
                      );

                      if (cityName != null) {
                        dynamic weatherInfo = await weather.getTypedLocationWeather(cityName);
                        if (weatherInfo != null) {
                           updateUI(weatherInfo);
                        }
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temperature.toStringAsFixed(1),
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $city!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// double temperature = data['main']['temp'];
// int condition = data['weather'][0]['id'];
// String city = data['name'];
