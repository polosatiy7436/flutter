import 'package:http/http.dart' as http;

const APIkey = '0FED3372-CA1E-4E40-A447-2BBAC6A90192';
const kHost = 'rest.coinapi.io';
const kPath = '/v1/exchangerate';

class NetworkHelper {
  Future<String> gerResponseData({String currency, String coin}) async {
    Uri uri = Uri.https(kHost, kPath + '/$coin/$currency');
    http.Response response = await http
        .get(uri, headers: <String, String>{'X-CoinAPI-Key': '$APIkey'});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
