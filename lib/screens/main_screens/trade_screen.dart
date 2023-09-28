import 'package:flutter/material.dart';
import 'package:tnance/helper/constans.dart';
import 'package:tnance/models/crypto_models.dart';
import 'package:tnance/widgets/chart_coin.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key, required this.cryptoCurrncyModel});
  final CryptoCurrncyModel cryptoCurrncyModel;
  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  TextEditingController coinConroller = TextEditingController();
  TextEditingController usdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: seconderycolor),
        title: Text(
          "Spot Trade",
          style: TextStyle(color: seconderycolor, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(
                    color: seconderycolor.withOpacity(0.3),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  widget.cryptoCurrncyModel.name.toString(),
                  style: TextStyle(
                      color: seconderycolor,
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: LineChartSample7(),
                ),
                Text(
                  widget.cryptoCurrncyModel.priceUsd.toString().substring(0, 8),
                  style: TextStyle(
                      color: seconderycolor,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: usdController,
                    decoration: InputDecoration(
                      focusColor: base3,
                      fillColor: base3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
