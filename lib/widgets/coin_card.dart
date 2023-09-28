import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnance/helper/constans.dart';

import 'package:tnance/models/crypto_models.dart';
import 'package:tnance/screens/main_screens/trade_screen.dart';
import 'package:tnance/widgets/chart_coin.dart';

class CoinCrad extends StatelessWidget {
  const CoinCrad({super.key, required this.cryptoCurrncyModel});

  final CryptoCurrncyModel cryptoCurrncyModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => TradeScreen(
                      cryptoCurrncyModel: cryptoCurrncyModel,
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            GridTile(
                footer: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Colors.transparent
                  ], begin: Alignment.center, end: Alignment.topCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cryptoCurrncyModel.symbol.toString(),
                          style: TextStyle(
                              color: seconderycolor,
                              fontSize: 28,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          cryptoCurrncyModel.priceUsd
                              .toString()
                              .substring(0, 8),
                          style: TextStyle(
                              color: greenG,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                child: LineChartSample7()),
          ],
        ),
      ),
    );
  }
}
