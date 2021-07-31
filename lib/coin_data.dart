import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

const apikey = '24B7BA08-930C-4DFD-801C-7D386384E9D5';

class CoinData {
  CoinData({@required this.currencyCode, @required this.cryptoCurrencyCode});
  final String currencyCode;
  final String cryptoCurrencyCode;
  String rate;
  Future<String> getCoinData() async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$cryptoCurrencyCode/$currencyCode?apikey=$apikey'));

    if (response.statusCode != 200) {
      print(response.statusCode);
      throw 'Problem with the get request';
    } else {
      return rate = jsonDecode(response.body)['rate'].toStringAsFixed(4);
    }
  }
}
