// To parse this JSON data, do
//
//     final coinImageModel = coinImageModelFromJson(jsonString);

import 'dart:convert';

List<CoinImageModel> coinImageModelFromJson(String str) => List<CoinImageModel>.from(json.decode(str).map((x) => CoinImageModel.fromJson(x)));

String coinImageModelToJson(List<CoinImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class CoinImageModel {
  CoinImageModel({
    this.assetId,
    this.url,
  });

  String? assetId;
  String? url;

  factory CoinImageModel.fromJson(Map<String, dynamic> json) => CoinImageModel(
    assetId: json["asset_id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "asset_id": assetId,
    "url": url,
  };
}
