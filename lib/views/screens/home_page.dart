import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/json_data_controller.dart';
import '../components/home_component.dart';
import '../components/library_component.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController homeController = Get.put(HomeController());
  // QuotesController quotesController = Get.put(QuotesController());
  JsonDataController jsonDataController = Get.find<JsonDataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "MyQu",
              style: GoogleFonts.aBeeZee(
                color: const Color(0xff09203F),
                fontSize: 24,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            const Icon(
              Icons.all_inclusive,
              size: 36,
              color: Color(0xff09203F),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              "tes",
              style: GoogleFonts.aBeeZee(
                color: const Color(0xff09203F),
                fontSize: 24,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/favorite_page');
            },
            icon: const Icon(Icons.favorite_border_rounded),
          ),
        ],
      ),
      body: PageView(
        controller: homeController.pageController,
        children: [
          HomeComponent(),
          // QuotesComponent(),
          // SearchComponent(),
          LibraryComponent(),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (index) {
            homeController.onPageChange(index: index);
          },
          currentIndex: homeController.getCurrentIndex,
          selectedLabelStyle: const TextStyle(color: Color(0xff09203F)),
          selectedItemColor: Color(0xff09203F),
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: 'Library',
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/add_quotes_page");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
