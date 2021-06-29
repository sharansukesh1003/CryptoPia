import 'package:btc_tracker/constants/constant_colors.dart';
import 'package:btc_tracker/models/newscard_model.dart';
import 'package:btc_tracker/services/news_data.dart';
import 'package:btc_tracker/views/newsarticle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ConstantColors constantColors = ConstantColors();

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsModel> newsData = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  getNewsData() async {
    NewsApi newsDataMain = NewsApi();
    await newsDataMain.getNewsData();
    newsData = newsDataMain.newsDataList;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.primaryColor,
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return NewsArticleWidget(
                        name: newsData[index].name,
                        title: newsData[index].title,
                        urlToImage: newsData[index].urlToImage,
                        description: newsData[index].description,
                      );
                    }),
              ),
            ),
    );
  }
}
