import 'package:btc_tracker/models/newscard_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
  List<NewsModel> newsDataList = [];

  final String _key = "83f93ca6d36a479a84c019e4488ebfe0";

  Future<void> getNewsData() async {
    final url =
        "https://newsapi.org/v2/everything?q=cryptocurrency&from=2021-05-29&sortBy=publishedAt&apiKey=$_key";

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
