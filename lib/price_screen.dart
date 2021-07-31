import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'Cards.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  var BTCrate = '?';
  var ETHrate = '?';
  var LTCrate = '?';

  // String rate;

  DropdownButton<String> androidDropdownbutton() {
    List<DropdownMenuItem<String>> currencylist = [];

    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        child: Text('$currency'),
        value: '$currency',
      );
      currencylist.add(item);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      iconSize: 30,
      style: TextStyle(
        fontSize: 25,
        color: Colors.grey.shade500,
      ),
      items: currencylist,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value;
            getData();
          },
        );
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> s = [];

    for (String currency in currenciesList) {
      var item = Text('$currency');
      s.add(item);
    }

    return CupertinoPicker(
      // backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedindex) {
        selectedCurrency = currenciesList[selectedindex];
      },
      children: s,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iosPicker();
    } else {
      return androidDropdownbutton();
    }
  }

  void getData() async {
    String currentBTCRate = await CoinData(
            currencyCode: selectedCurrency, cryptoCurrencyCode: 'BTC')
        .getCoinData();
    String currentETHRate = await CoinData(
            currencyCode: selectedCurrency, cryptoCurrencyCode: 'ETH')
        .getCoinData();
    String currentLTCRate = await CoinData(
            currencyCode: selectedCurrency, cryptoCurrencyCode: 'LTC')
        .getCoinData();

    setState(() {
      BTCrate = currentBTCRate;
      ETHrate = currentETHRate;
      LTCrate = currentLTCRate;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('💲Coin Ticker💲')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                ExchangeRateCard(
                  rate: BTCrate,
                  selectedCurrency: selectedCurrency,
                  selectedCryptoCurrency: cryptoList[0],
                ),
                ExchangeRateCard(
                  rate: ETHrate,
                  selectedCurrency: selectedCurrency,
                  selectedCryptoCurrency: cryptoList[1],
                ),
                ExchangeRateCard(
                  rate: LTCrate,
                  selectedCurrency: selectedCurrency,
                  selectedCryptoCurrency: cryptoList[2],
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.black54,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
