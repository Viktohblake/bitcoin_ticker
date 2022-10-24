import 'package:http/http.dart';
import 'dart:convert';

const apiKey = "2314A345-C187-48CF-B419-4AA7260EE5F7";

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

  Future getDataCoin(String selectedCurrency) async {
    Map cryptoPrices = {};

    for(String crypto in cryptoList) {
      String url = 'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=$apiKey';
      Uri uriAsUrl = Uri.parse(url);
      Response response = await get(uriAsUrl);
      var decodedData = jsonDecode(response.body);

      double finalPrice = decodedData['rate'];

      cryptoPrices[crypto] = finalPrice.toStringAsFixed(0);

      return cryptoPrices;
    }

  }

  // for (String crypto in cryptoList) {
  // //Update the URL to use the crypto symbol from the cryptoList
  // String requestURL =
  // '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
  // http.Response response = await http.get(requestURL);
  // if (response.statusCode == 200) {
  // var decodedData = jsonDecode(response.body);
  // double lastPrice = decodedData['rate'];
  // //Create a new key value pair, with the key being the crypto symbol and the value being the lastPrice of that crypto currency.
  // cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
  // } else {
  // print(response.statusCode);
  // throw 'Problem with the get request';
  // }
  // }
  // return cryptoPrices;
}
