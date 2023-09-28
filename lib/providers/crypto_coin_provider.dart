import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tnance/models/crypto_models.dart';

import '../services/api.dart';

class CryptoProvider with ChangeNotifier {
  Api api = Api();

  List<CryptoCurrncyModel> coins = [];
  // CryptoCurrncyModel? currentcoin;

  bool isLoading = true;
  bool isFailed = false;

  setLoading(bool status) {
    Timer(const Duration(milliseconds: 50), () {
      isLoading = status;
      notifyListeners();
    });
  }

  setFailed(bool status) {
    Timer(const Duration(milliseconds: 50), () {
      isFailed = status;
      notifyListeners();
    });
  }

  fetchCoins() async {
    setLoading(true);

    final response =
        await http.get(Uri.parse("https://api.coincap.io/v2/assets"));

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body)['data'];
      for (var x in decodedData) {
        coins.add(CryptoCurrncyModel.fromJson(x));
      }
    } else {
      setFailed(true);
    }

    setLoading(false);
  }

  // fetchDCoins(String symbol, String query) async {
  //   setLoading(true);
  //   final response = await api.get('https://api.coincap.io/v2/assets/');

  //   if (response.statusCode == 200) {
  //     currentcoin = CryptoCurrncyModel.fromJson(jsonDecode(response.body));
  //     setFailed(false);
  //   } else {
  //     setFailed(true);
  //   }

  //   setLoading(false);
  // }
}
