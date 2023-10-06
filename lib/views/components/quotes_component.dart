import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../controllers/quotes_controller.dart';
import '../../utils/constant.dart';
import '../../utils/quotes.dart';

class QuotesComponent extends StatelessWidget {
  QuotesComponent({super.key});

  QuotesController quotesController = Get.find<QuotesController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(0),
      child: (quotesController.imageList != null)
          ? Stack(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: Obx(() {
                    return BlurHash(
                      key: ValueKey(quotesController
                              .imageList[quotesController.imageNo.toInt()]
                          ['blur_hash']),
                      hash: quotesController
                              .imageList[quotesController.imageNo.toInt()]
                          ['blur_hash'],
                      duration: const Duration(milliseconds: 500),
                      image: quotesController
                              .imageList[quotesController.imageNo.toInt()]
                          ['urls']['regular'],
                      curve: Curves.easeInOutBack,
                      imageFit: BoxFit.cover,
                    );
                  }),
                ),
                Container(
                  width: width,
                  height: height,
                  color: Colors.black.withOpacity(0.6),
                ),
                SizedBox(
                  width: width,
                  height: height,
                  child: SafeArea(
                    child: CarouselSlider.builder(
                      itemCount: quotesList.length,
                      itemBuilder: (context, index, _) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                quotesList[index][kQuote],
                                style: kQuoteTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '- ${quotesList[index][kAuthor]} -',
                              style: kAuthorTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                          scrollDirection: Axis.vertical,
                          pageSnapping: true,
                          initialPage: 0,
                          enlargeCenterPage: true,
                          onPageChanged: (index, value) {
                            HapticFeedback.lightImpact();
                            quotesController.carouselIndexIncrement(
                                index: index);
                          }),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 18,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
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
            ),
    );
  }
}
