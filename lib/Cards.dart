import 'package:flutter/material.dart';

class ExchangeRateCard extends StatelessWidget {
  ExchangeRateCard({
    @required this.rate,
    @required this.selectedCurrency,
    @required this.selectedCryptoCurrency,
  });

  final String rate;
  final String selectedCurrency;
  final String selectedCryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $selectedCryptoCurrency = $rate $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
