import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuotesController extends GetxController {
  RxList imageList = [].obs;
  RxInt imageNo = 0.obs;

  String accessKey = "TjRXDNWN67eTrnkWSOYHPQsoFjrscph7M1VdLnL6De0";

  carouselIndexIncrement({required int index}) {
    imageNo(index);
  }

  getImages() async {
    String url =
        'https://api.unsplash.com/search/photos?per_page=30&query=nature&order_by=relevant&client_id=$accessKey';
    Uri uri = Uri.parse(url);

    var response = await http.get(uri);
    log("${response.statusCode}");

    var allData = json.decode(response.body);
    imageList(allData['results']);
    log("$imageList");
    update();
  }
}
