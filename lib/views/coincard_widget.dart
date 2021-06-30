import 'package:flutter/cupertino.dart';
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
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: constantColors.secondaryColor,
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
                        backgroundColor: constantColors.secondaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 90,
                        width: 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          Text(
                            symbol.toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: constantColors.smallTextColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "High :",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: constantColors.smallTextColor),
                              ),
                              SizedBox(width: 3),
                              Text(
                                highPrice.toString(),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Low :",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: constantColors.smallTextColor),
                              ),
                              SizedBox(width: 3),
                              Text(
                                lowPrice.toString(),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
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
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Text(
                      "\$",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
