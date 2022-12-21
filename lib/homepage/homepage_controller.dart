import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/all_coin_list_model.dart';
import '../model/coin_image_model.dart';
import '../utils/app_string.dart';

final homeProvider = Provider((ref) => MyHomePageController());

class MyHomePageController {

  List<AllCoinListModel> allCoinListModel = [];
  List<CoinImageModel> coinImageList = [];

  final client = Dio();

  Future<List<AllCoinListModel>?> getCoinListFromApi() async {
    try {
        final response = await client.get(AppString.urlCoinDataList,
            options: Options(headers: {
              AppString.coinApiKey: AppString.coinApiValue
            }));
        if (response.statusCode == 200) {
          allCoinListModel = allCoinListModelFromJson(jsonEncode(response.data));

          getCoinImageList().then((value){
            if(value != null){
              allCoinListModel.forEach((value) {
                coinImageList.forEach((element) {
                  if(element.assetId == value.assetId){
                    value.image = element.url;
                  }
                });

              });
            }
          });
          return allCoinListModel;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
  }

  Future<List<CoinImageModel>?> getCoinImageList()async {
    try{
      final response = await client.get(AppString.coinImageList,options: Options(
          headers: {
            AppString.coinApiKey: AppString.coinApiValue
          }
      ));
      if(response.statusCode == 200){
        coinImageList = coinImageModelFromJson(jsonEncode(response.data));

        return coinImageList;
      }
    }
    catch(e){
      debugPrint(e.toString());
    }
    return null;
  }

}
