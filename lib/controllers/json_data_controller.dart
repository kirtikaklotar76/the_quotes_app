import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../modals/quote_modal.dart';

class JsonDataController extends GetxController {
  List allQuotesData = [];
  List quotesList = [];
  RxList allFavorite = [].obs;
  RxList allSearchQuotes = [].obs;
  RxString searchValue = ''.obs;
  RxBool isFavorite = false.obs;

  TextEditingController searchController = TextEditingController();

  QuoteModal quoteModal = QuoteModal.init();

  loadData() async {
    String jsonData = await rootBundle.loadString('assets/json/quotes.json');
    List allData = json.decode(jsonData);
    allQuotesData = allData.map((e) => QuoteModal.fromMap(data: e)).toList();
    allSearchQuotes(allData.map((e) => QuoteModal.fromMap(data: e)).toList());
  }

  checkFavorite() {
    isFavorite(!isFavorite.value);
  }

  onFavoriteTapped({required QuoteModal data}) {
    allFavorite.add(data);
  }

  delete({required int index}) {
    allFavorite.removeAt(index);
  }

  search({required String value}) {
    log("$allSearchQuotes");

    if(allSearchQuotes.isEmpty) {
      allSearchQuotes(allQuotesData);
    }

    value = value.toLowerCase();
    log(value);

    List result = [];

    for (var e in allSearchQuotes) {
      var sQuote = e['quote'].toString().toLowerCase();
      if(sQuote.contains(value)) {
        result.add(e);
      }
    }

    allSearchQuotes(result);
  }
}

