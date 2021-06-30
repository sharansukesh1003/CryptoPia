import 'package:flutter/material.dart';
import 'package:btc_tracker/constants/constant_colors.dart';

ConstantColors constantColors = ConstantColors();

class NewsArticleWidget extends StatelessWidget {
  final String name, title, urlToImage, description;

  NewsArticleWidget(
      {@required this.name,
      @required this.title,
      @required this.urlToImage,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image(
                image: NetworkImage(urlToImage),
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: constantColors.stackColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  SizedBox(height: 3),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: constantColors.newsHeadSepratorColor,
                    ),
                    height: 3,
                    width: 70,
                  ),
                  SizedBox(height: 3),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: constantColors.newsCardBottomColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              description,
              style: TextStyle(
                  color: constantColors.smallTextColor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
