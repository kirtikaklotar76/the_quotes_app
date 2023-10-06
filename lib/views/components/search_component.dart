import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../controllers/json_data_controller.dart';
import '../../modals/quote_modal.dart';
import '../../utils/constant.dart';

class SearchComponent extends StatelessWidget {
  SearchComponent({super.key});

  JsonDataController jsonDataController = Get.find<JsonDataController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: jsonDataController.searchController,
            onChanged: (val) {
              jsonDataController.search(value: val);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Search Quotes",
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: Obx(() {
              return jsonDataController.allSearchQuotes.value.isNotEmpty
                  ? ListView.builder(
                      itemCount:
                          jsonDataController.allSearchQuotes.value.length,
                      itemBuilder: (context, index) {
                        QuoteModal quoteModal =
                            jsonDataController.allSearchQuotes.value[index];
                        Color c1 = color1[index % 10];
                        Color c2 = color2[index % 10];

                        return Container(
                          margin: const EdgeInsets.all(10),
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                c1,
                                c2,
                              ],
                            ),
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      jsonDataController.onFavoriteTapped(
                                          data: quoteModal);
                                      jsonDataController.checkFavorite();
                                      Get.snackbar('Successfully Added',
                                          '${quoteModal.quote}');
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border,
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
        ],
      ),
    );
  }
}
