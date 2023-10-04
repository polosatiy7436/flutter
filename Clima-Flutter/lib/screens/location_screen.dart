import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.weatherData);
  final String weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String weatherDescription;
  String cityName;
  String weatherIcon;

  void updateUiData(String weatherData) {
    if (weatherData == null) {
      _setErrorState();
      return;
    }
    _setWeatherParameters(weatherData);
    print(cityName);
  }

  void _setErrorState() {
    cityName = '';
    temperature = 0;
    weatherDescription = 'Error fetching data';
    weatherIcon = '';
  }

  void _setWeatherParameters(String weatherData) {
    cityName = jsonDecode(weatherData)['name'];
    double tempAsDouble = jsonDecode(weatherData)['main']['temp'];
    temperature = tempAsDouble.toInt();
    weatherIcon = WeatherModel()
        .getWeatherIcon(jsonDecode(weatherData)['weather'][0]['id']);
    weatherDescription = WeatherModel().getMessage(temperature);
  }

  @override
  void initState() {
    super.initState();
    updateUiData(widget.weatherData);
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
                  FlatButton(
                    onPressed: () async {
                      String weatherData = await NetworkHelper()
                          .getLocationWeather(Location().getLocation());
                      updateUiData(weatherData);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var enteredCity = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (enteredCity == null) {
                        return;
                      }
                      cityName = enteredCity;
                      updateUiData(
                        await NetworkHelper().getCityWeather(cityName),
                      );
                      setState(() {});
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
                      '$temperature°',
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
                  "$weatherDescription in $cityName",
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
