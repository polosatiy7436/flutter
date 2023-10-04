//TODO: Add your imports here.

import 'dart:convert';

import 'package:bitcoin_ticker/utils/network_helper.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<List<int>> getCoinData({List<String> coins, String currency}) async {
    List<String> responses = [];
    List<double> pricesAsDouble = [];
    List<int> prices = [];
    for (int i = 0; i < coins.length; i++) {
      responses.add(await NetworkHelper()
          .gerResponseData(coin: coins[i], currency: currency));
    }
    for (int i = 0; i < coins.length; i++) {
      pricesAsDouble.add(jsonDecode(responses[i])['rate']);
      prices.add(pricesAsDouble[i].toInt());
    }
    return prices;
  }
}
