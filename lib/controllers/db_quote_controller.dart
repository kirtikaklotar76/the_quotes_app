import 'package:get/get.dart';

import '../helpers/db_helper.dart';
import '../modals/quote_modal.dart';

class DBQuoteController extends GetxController {
  final RxList _allQuotes = [].obs;

  getAllQuotes() async {
    _allQuotes(await DBHelper.dbHelper.fetchQuote());
  }

  RxList get fetchQuote {
    return _allQuotes;
  }

  Future<int> insertQuotes({required QuoteModal quoteModal}) {
    return DBHelper.dbHelper.insertQuote(quoteModal: quoteModal);
  }

  Future<int> deleteQuote({required int id}) async {
    getAllQuotes();

    if (_allQuotes.any((element) => element.id == id)) {
      Get.snackbar("Quote Deleted !!", "$id does not exist...");
      return await DBHelper.dbHelper.deleteQuote(id: id);
    } else {
      Get.snackbar("ERROR !!", "$id does not exist...");
      return 0;
    }
  }
}
