import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tour_carousel_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CrouselHandler extends StatefulWidget {
  const CrouselHandler({super.key});

  @override
  State<CrouselHandler> createState() => _CrouselHandlerState();
}

class _CrouselHandlerState extends State<CrouselHandler> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: Provider.of<Tcarousel>(context).getCarouselData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cImages = Provider.of<Tcarousel>(context).images;

            print(cImages);
            final imgs1 = cImages.sublist(0, 5).map((e) {
              return {'image': e['image'], 'title': e['title']};
            }).toList();

            Widget buildImage(int index) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://bensalcie.payherokenya.com/portal/images/${imgs1[index]['image']}',
                          ),
                          fit: BoxFit.cover)),
                  child: Container(
                      margin: const EdgeInsets.only(top: 250),
                      child: Text(
                        imgs1[index]['title'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      )),
                );

            Widget buildIndicator() => AnimatedSmoothIndicator(
                  activeIndex: _current,
                  count: imgs1.length,
                  effect: const SlideEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.grey,
                      strokeWidth: 2),
                );

            return Stack(
              children: [
                CarouselSlider.builder(
                    itemCount: imgs1.length,
                    itemBuilder: (context, index, realIndex) {
                      return buildImage(index);
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
                  child: buildIndicator(),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        });
  }
}
