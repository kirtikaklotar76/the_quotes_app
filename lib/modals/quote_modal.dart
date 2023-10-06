import 'dart:developer';

class QuoteModal {
  int? id;
  String? quote;
  String? author;

  QuoteModal(
    this.id,
    this.quote,
    this.author,
  );

  QuoteModal.init() {
    log("Quote Modal Initialized...");
  }

  factory QuoteModal.fromMap({required Map data}) {
    return QuoteModal(
      data['id'],
      data['quote'],
      data['author'],
    );
  }
}
