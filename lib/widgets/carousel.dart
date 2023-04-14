import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../providers/tour_carousel_provider.dart';

class CrouselHandler extends StatefulWidget {
  const CrouselHandler({super.key});

  @override
  State<CrouselHandler> createState() => _CrouselHandlerState();
}

class _CrouselHandlerState extends State<CrouselHandler> {
  @override
  void initState() {
    super.initState();
    context.read<Tcarousel>().getCarouselData();
  }

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    // return
    // FutureBuilder<List>(
    //     future: getCarouselData(),

    //     // Provider.of<Tcarousel>(context, listen: false).getCarouselData(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(
    //             color: Colors.blue,
    //           ),
    //         );
    //       } else if (snapshot.connectionState == ConnectionState.done) {
    //         // if (snapshot.error != null) {
    //         final cImages = Provider.of<Tcarousel>(context).images;

    //         // print(cImages);
    //         final imgs1 = cImages.sublist(0, 5).map((e) {
    //           return {'image': e['image'], 'title': e['title']};
    //         }).toList();

    //         return Stack(
    //           children: [
    //             CarouselSlider.builder(
    //                 itemCount: imgs1.length,
    //                 itemBuilder: (context, index, realIndex) {
    //                   return buildImage(index, imgs1);
    //                 },
    //                 options: CarouselOptions(
    //                   initialPage: 0,
    //                   viewportFraction: 1,
    //                   height: 300,
    //                   onPageChanged: (index, reason) {
    //                     // setState(() {
    //                     _current = index;
    //                     // });
    //                   },
    //                   scrollDirection: Axis.horizontal,
    //                   autoPlay: true,
    //                   autoPlayInterval: const Duration(seconds: 2),
    //                 )),
    //             Positioned(
    //               bottom: 10,
    //               left: 150,
    //               child: buildIndicator(_current, imgs1),
    //             ),
    //           ],
    //         );

    //         // } else {
    //         //   print(snapshot.error);
    //         //   return Text('${snapshot.error}');
    //         // }
    //       }
    //       return const Text('Default State');
    //     });

    return Consumer<Tcarousel>(builder: (context, notifier, child) {
      if (notifier.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      final images = notifier.images.take(5).toList();
      // print('Now:$images');
      return SafeArea(
        child: Stack(
          children: [
            CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  return buildImage(images[index]);
                },
                options: CarouselOptions(
                  initialPage: 0,
                  viewportFraction: 1,
                  height: 300,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                )),
            Positioned(
              bottom: 10,
              left: 150,
              child: buildIndicator(_current, images),
            ),
          ],
        ),
      );
    });
  }

  // Future<List> getCarouselData() async {
  //   List images = [];
  //   try {
  //     var response = await http.get(
  //         Uri.parse('https://bensalcie.payherokenya.com/portal/api/tour.php'));
  //     // print("Reponse :${response.statusCode}");
  //     print(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       // _images = TourCarousel.fromJson(jsonDecode(response.body));
  //       // print("Reponse :${response.body}");

  //       final jsonResponse = jsonDecode(response.body);
  //       // print("jsonResponse: ${jsonResponse}");

  //       // images = {response.body['data']} as List<Data>;

  //       images = jsonResponse['data'] as List;
  //     } else {
  //       throw Exception('Failed to Load Album');
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  //   return images;
  // }
}

Widget buildImage(dynamic image) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://bensalcie.payherokenya.com/portal/images/${image['image']}',
              ),
              fit: BoxFit.cover)),
      child: Container(
          margin: const EdgeInsets.only(top: 250),
          child: Text(
            image['title'],
            style: const TextStyle(color: Colors.white, fontSize: 18),
          )),
    );

Widget buildIndicator(int current, List images) => AnimatedSmoothIndicator(
      activeIndex: current,
      count: images.length,
      effect: const SlideEffect(
          activeDotColor: Colors.white, dotColor: Colors.grey, strokeWidth: 2),
    );
