import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'JPY',
  'USD',
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'D7AA2B0F-84BB-48ED-B8D7-3ABF9C6687CC';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
