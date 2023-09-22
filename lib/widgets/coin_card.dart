import 'package:flutter/material.dart';

import 'package:tnance/models/crypto_models.dart';

class CoinCrad extends StatelessWidget {
  const CoinCrad({super.key, required this.cryptoCurrncyModel});

  final CryptoCurrncyModel cryptoCurrncyModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          GridTile(
            footer: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black87, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cryptoCurrncyModel.symbol.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      cryptoCurrncyModel.priceUsd,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            child: Image.network(
              cryptoCurrncyModel.symbol,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
