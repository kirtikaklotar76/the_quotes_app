import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  PageController pageController = PageController();

  int get getCurrentIndex {
    return _currentIndex.value;
  }

  void onPageChange({required int index}) {
    _currentIndex(index);

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
}