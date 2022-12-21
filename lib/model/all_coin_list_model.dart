// To parse this JSON data, do
//
//     final allCoinListModel = allCoinListModelFromJson(jsonString);

import 'dart:convert';

List<AllCoinListModel> allCoinListModelFromJson(String str) => List<AllCoinListModel>.from(json.decode(str).map((x) => AllCoinListModel.fromJson(x)));

String allCoinListModelToJson(List<AllCoinListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCoinListModel {
  AllCoinListModel({
    this.assetId,
    this.image,
    this.name,
    this.typeIsCrypto,
    this.dataQuoteStart,
    this.dataQuoteEnd,
    this.dataOrderbookStart,
    this.dataOrderbookEnd,
    this.dataTradeStart,
    this.dataTradeEnd,
    this.dataSymbolsCount,
    this.volume1HrsUsd,
    this.volume1DayUsd,
    this.volume1MthUsd,
    this.idIcon,
    this.dataStart,
    this.dataEnd,
    this.priceUsd,
  });

  String? assetId;
  String? name;
  int? typeIsCrypto;
  DateTime? dataQuoteStart;
  DateTime? dataQuoteEnd;
  DateTime? dataOrderbookStart;
  DateTime? dataOrderbookEnd;
  DateTime? dataTradeStart;
  DateTime? dataTradeEnd;
  int? dataSymbolsCount;
  num? volume1HrsUsd;
  num? volume1DayUsd;
  num? volume1MthUsd;
  String? idIcon;
  String? dataStart;
  String? dataEnd;
  num? priceUsd;
  String? image;

  factory AllCoinListModel.fromJson(Map<String, dynamic> json) {

    return AllCoinListModel(
      assetId: json["asset_id"],
      name: json["name"],
      typeIsCrypto: json["type_is_crypto"],
      dataQuoteStart: json["data_quote_start"] == null ? null : DateTime.parse(json["data_quote_start"]),
      dataQuoteEnd: json["data_quote_end"] == null ? null : DateTime.parse(json["data_quote_end"]),
      dataOrderbookStart: json["data_orderbook_start"] == null ? null : DateTime.parse(json["data_orderbook_start"]),
      dataOrderbookEnd: json["data_orderbook_end"] == null ? null : DateTime.parse(json["data_orderbook_end"]),
      dataTradeStart: json["data_trade_start"] == null ? null : DateTime.parse(json["data_trade_start"]),
      dataTradeEnd: json["data_trade_end"] == null ? null : DateTime.parse(json["data_trade_end"]),
      dataSymbolsCount: json["data_symbols_count"],
      volume1HrsUsd: json["volume_1hrs_usd"],
      volume1DayUsd: json["volume_1day_usd"],
      volume1MthUsd: json["volume_1mth_usd"] ,
      idIcon: json["id_icon"],
      dataStart: json["data_start"],
      dataEnd: json["data_end"],
      priceUsd: json["price_usd"],
    );
  }

  Map<String, dynamic> toJson() => {
    "asset_id": assetId ,
    "name": name,
    "type_is_crypto": typeIsCrypto,
    "data_quote_start": dataQuoteStart == null ? null : dataQuoteStart!.toIso8601String(),
    "data_quote_end": dataQuoteEnd == null ? null : dataQuoteEnd!.toIso8601String(),
    "data_orderbook_start": dataOrderbookStart == null ? null : dataOrderbookStart!.toIso8601String(),
    "data_orderbook_end": dataOrderbookEnd == null ? null : dataOrderbookEnd!.toIso8601String(),
    "data_trade_start": dataTradeStart == null ? null : dataTradeStart!.toIso8601String(),
    "data_trade_end": dataTradeEnd == null ? null : dataTradeEnd!.toIso8601String(),
    "data_symbols_count": dataSymbolsCount ,
    "volume_1hrs_usd": volume1HrsUsd ,
    "volume_1day_usd": volume1DayUsd,
    "volume_1mth_usd": volume1MthUsd,
    "id_icon": idIcon,
    "data_start": dataStart,
    "data_end": dataEnd,
    "price_usd": priceUsd,
  };
}
