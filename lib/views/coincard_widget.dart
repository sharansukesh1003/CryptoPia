import 'package:flutter/material.dart';
import 'package:btc_tracker/constants/constant_colors.dart';

final ConstantColors constantColors = ConstantColors();

class CoinCardView extends StatelessWidget {
  final String logoUrl, name, symbol;
  final num price, highPrice, lowPrice;
  CoinCardView(
      {@required this.name,
      @required this.logoUrl,
      @required this.price,
      @required this.symbol,
      @required this.highPrice,
      @required this.lowPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.network(logoUrl),
                        radius: 40,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: constantColors.sepratorColor,
                        height: 70,
                        width: 3,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: constantColors.currencyColor),
                          ),
                          Text(
                            symbol,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: constantColors.secondaryColor),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "High",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: constantColors.secondaryColor),
                              ),
                              SizedBox(width: 3),
                              Text(
                                highPrice.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.green),
                              ),
                              Text(
                                "\$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Low",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: constantColors.secondaryColor),
                              ),
                              SizedBox(width: 3),
                              Text(
                                lowPrice.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                              Text(
                                "\$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: constantColors.currencyColor),
                    ),
                    Text(
                      "\$",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green),
                    ),
                  ],
                ),
              ],
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
