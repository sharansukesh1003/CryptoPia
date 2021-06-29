import 'package:btc_tracker/services/crypto_data.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:btc_tracker/constants/constant_colors.dart';
import 'package:btc_tracker/models/coincard_model.dart';
import 'package:btc_tracker/views/coincard_widget.dart';

final ConstantColors constantColors = ConstantColors();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CoinCardModel> coinData = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCryptoData();
    print('Called');
  }

  getCryptoData() async {
    CryptoApi cryptoApiClass = CryptoApi();
    await cryptoApiClass.getCurrencyData();
    coinData = cryptoApiClass.cryptoData;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: constantColors.primaryColor,
        elevation: 3,
        title: Text(
          "Cryptopia",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: constantColors.titleColor),
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: coinData.length,
                    itemBuilder: (context, index) {
                      return CoinCardView(
                        logoUrl: coinData[index].logoUrl,
                        name: coinData[index].name,
                        symbol: coinData[index].symbol,
                        price: coinData[index].price,
                        highPrice: coinData[index].highPrice,
                        lowPrice: coinData[index].lowPrice,
                      );
                    }),
              ),
            ),
    );
  }
}
