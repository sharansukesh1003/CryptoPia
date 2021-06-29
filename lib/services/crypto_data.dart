import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:btc_tracker/models/coincard_model.dart';

class CryptoApi {
  List<CoinCardModel> cryptoData = [];

  Future<void> getCurrencyData() async {
    final url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkLine=false";

    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      jsonData.forEach((i) {
        if (i['image'] != null && i['current_price'] != null) {
          CoinCardModel coinData = CoinCardModel(
              symbol: i['symbol'],
              name: i['name'],
              logoUrl: i['image'],
              price: i['current_price'],
              highPrice: i['high_24h'],
              lowPrice: i['low_24h']);
          cryptoData.add(coinData);
        }
      });
    }
  }
}
