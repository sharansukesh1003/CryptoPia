import 'package:btc_tracker/models/newscard_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewsApi {
  List<NewsModel> newsDataList = [];

  final String _key = "ur key here";

  Future<void> getNewsData() async {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    final String date = formatter.format(now);
    print(date);

    final url =
        "https://newsapi.org/v2/everything?q=cryptocurrency&from=$date&sortBy=publishedAt&apiKey=$_key";

    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach((i) {
        if (i['title'] != null && i['urlToImage'] != null) {
          NewsModel newsData = NewsModel(
              name: i['source']['name'],
              urlToImage: i['urlToImage'],
              title: i['title'],
              description: i['description'],
              url: i['url']);
          newsDataList.add(newsData);
        }
      });
    }
  }
}
