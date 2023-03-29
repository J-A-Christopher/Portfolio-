import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tour_carousel_provider.dart';
import '../widgets/tour_item.dart';

class TourServices extends StatefulWidget {
  const TourServices({super.key});

  @override
  State<TourServices> createState() => _TourServices();
}

class _TourServices extends State<TourServices> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Tcarousel>().getCarouselData();
  }

  @override
  Widget build(BuildContext context) {
    // final result = Provider.of<Tcarousel>(context).getCarouselData();
    // print('Results:$result');
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            'Tour my Experiences',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Consumer<Tcarousel>(
          builder: (context, notifier, child) {
            if (notifier.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            }
            final images1 = notifier.images.toList();
            print('Sahii$images1');

            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TourItem(
                          pageTitle: images1[index]['title'] ?? 'null',
                          imgUrl:
                              'https://bensalcie.payherokenya.com/portal/images/${images1[index]['image']}');
                    }));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 300,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://bensalcie.payherokenya.com/portal/images/${images1[index]['image']}'),
                            fit: BoxFit.cover),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Container(
                        margin: const EdgeInsets.only(top: 250, left: 60),
                        child: Text(
                          images1[index]['title'] ?? '',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )),
                  ),
                );
              },
              itemCount: images1.length,
            );

            // Center(
            //   child: Text('${notifier.images}'),
            // );
          },
        )
        // FutureBuilder<List>(
        //     future: Provider.of<Tcarousel>(context).getCarouselData(),
        //     builder: (context, snapshot) {
        //       print('Future State:${snapshot.connectionState}');
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(
        //             color: Colors.blue,
        //           ),
        //         );
        //       } else {
        //         if (snapshot.hasData) {
        //           final cImages = Provider.of<Tcarousel>(context).images;

        //           // print(' All Images:${cImages.length}');
        //           final imgs1 = cImages.map((e) {
        //             return {'image': e['image'], 'title': e['title']};
        //           }).toList();

        //           // print('Mapped :${imgs1}');
        //           return ListView.builder(
        //             itemBuilder: (context, index) {
        //               return Stack(
        //                 children: [
        //                   Container(
        //                     height: 150,
        //                     decoration: BoxDecoration(
        //                         image: DecorationImage(
        //                       fit: BoxFit.cover,
        //                       image: NetworkImage(
        //                         'https://bensalcie.payherokenya.com/portal/images/${imgs1[index]['image']}',
        //                       ),
        //                     )),
        //                   )
        //                 ],
        //               );
        //             },
        //             itemCount: cImages.length,
        //           );
        //         }
        //         print(snapshot.error);
        //         return Text('${snapshot.error}');
        //       }
        //     }),
        );
  }
}
