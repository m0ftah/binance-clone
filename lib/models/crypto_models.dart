
import 'dart:convert';

CryptoCurrncyModel cryptoCurrncyModelFromJson(String str) =>
    CryptoCurrncyModel.fromJson(json.decode(str));

String cryptoCurrncyModelToJson(CryptoCurrncyModel data) =>
    json.encode(data.toJson());

class CryptoCurrncyModel {
  String id;
  String rank;
  String symbol;
  String name;
  String supply;
  String? maxSupply;
  String marketCapUsd;
  String volumeUsd24Hr;
  String priceUsd;
  String changePercent24Hr;
  String? vwap24Hr;
  String? explorer;

  CryptoCurrncyModel({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
  });

  factory CryptoCurrncyModel.fromJson(Map<String, dynamic> json) =>
      CryptoCurrncyModel(
        id: json["id"],
        rank: json["rank"],
        symbol: json["symbol"],
        name: json["name"],
        supply: json["supply"],
        maxSupply: json["maxSupply"],
        marketCapUsd: json["marketCapUsd"],
        volumeUsd24Hr: json["volumeUsd24Hr"],
        priceUsd: json["priceUsd"],
        changePercent24Hr: json["changePercent24Hr"],
        vwap24Hr: json["vwap24Hr"],
        explorer: json["explorer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "symbol": symbol,
        "name": name,
        "supply": supply,
        "maxSupply": maxSupply,
        "marketCapUsd": marketCapUsd,
        "volumeUsd24Hr": volumeUsd24Hr,
        "priceUsd": priceUsd,
        "changePercent24Hr": changePercent24Hr,
        "vwap24Hr": vwap24Hr,
        "explorer": explorer,
      };
}
