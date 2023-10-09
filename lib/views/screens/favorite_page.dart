import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../controllers/json_data_controller.dart';
import '../../modals/quote_modal.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  JsonDataController jsonDataController = Get.find<JsonDataController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Quotes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return jsonDataController.allFavorite.isNotEmpty
              ? ListView.builder(
                  itemCount: jsonDataController.allFavorite.length,
                  itemBuilder: (context, index) {
                    QuoteModal quoteModal =
                        jsonDataController.allFavorite[index];

                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListTile(
                            title: Text(
                              quoteModal.quote!,
                              style: GoogleFonts.acme(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "- ${quoteModal.author!}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                        text:
                                            "${quoteModal.quote!}\n\n - ${quoteModal.author}"),
                                  );
                                },
                                icon: const Icon(
                                  Icons.copy_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  jsonDataController.delete(index: index);
                                  Get.snackbar(
                                      'Quote Deleted', '${quoteModal.quote}');
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  jsonDataController.delete(index: index);
                                  Get.snackbar(
                                      'Quote Deleted', '${quoteModal.quote}');
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Share.share(
                                      "${quoteModal.quote!}\n\n - ${quoteModal.author}");
                                },
                                icon: const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              : SizedBox(
                  height: height - 185,
                  width: width - 0.2,
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: SpinKitFadingCircle(
                      color: Color(0xff09203F),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
