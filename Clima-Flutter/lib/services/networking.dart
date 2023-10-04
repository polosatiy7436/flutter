import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

import '../utilities/constants.dart';

class NetworkHelper {
  Future<String> getLocationWeather(Future<Location> location) async {
    Uri url = _generateLocationUrl(await location);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Future<String> getCityWeather(String cityName) async {
    Uri url = _generateCityUrl(cityName);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Uri _generateCityUrl(String cityName) {
    var url = Uri.https(kHost, kPath, {
      'q': cityName,
      'appid': kOpenWeatherAPIkey,
      'units': 'metric',
    });
    return url;
  }

  Uri _generateLocationUrl(Location location) {
    var url = Uri.https(kHost, kPath, {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': kOpenWeatherAPIkey,
      'units': 'metric',
    });
    return url;
  }
}
