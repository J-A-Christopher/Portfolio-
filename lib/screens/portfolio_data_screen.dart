import 'package:flutter/material.dart';
import '../providers/portfolio_provider.dart';
import 'package:provider/provider.dart';

class PortfolioData extends StatefulWidget {
  const PortfolioData({super.key});

  @override
  State<PortfolioData> createState() => _PortfolioDataState();
}

class _PortfolioDataState extends State<PortfolioData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PortfolioRetrievedData>().getPortfolioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Portfolio',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body:
          Consumer<PortfolioRetrievedData>(builder: (context, notifier, child) {
        if (notifier.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white70, width: 1)),
                elevation: 1,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(
                              '${notifier.portData.services?[index].title}',
                              maxLines: 1,
                            ),
                            Text(
                              '${notifier.portData.services?[index].description}',
                              maxLines: 2,
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          child: Image.network(
                            "https://bensalcie.payherokenya.com/portal/images/${notifier.portData.services?[index].image}",
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                        )),
                  ],
                ),
              );

              // return SizedBox(
              //   height: 170,
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15)),
              //     color: Colors.grey[300],
              //     child: SizedBox(
              //         child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           // margin: const EdgeInsets.only(left: 8, top: 3),
              //           child: Text(
              //             '${notifier.portData.services?[index].title}',
              //             style: const TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.grey,
              //                 fontSize: 17),
              //           ),
              //         ),
              //         Row(
              //           children: [
              //             Expanded(
              //                 flex: 2,
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(left: 10),
              //                   child: Text(
              //                     '${notifier.portData.services?[index].description}',
              //                     maxLines: 4,
              //                     style: const TextStyle(fontSize: 12),
              //                   ),
              //                 )),
              //             Expanded(
              //               flex: 1,
              //               child: Image.network(
              //                 'https://bensalcie.payherokenya.com/portal/images/${notifier.portData.services?[index].image}',
              //                 height: 160,
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ],
              //         )
              //       ],
              //     )

              //         // Row(
              //         //   children: [
              //         //     Column(
              //         //       children: [
              //         //         Text(
              //         //           '${notifier.portData.services?[index].title}',
              //         //           style: const TextStyle(fontWeight: FontWeight.bold),
              //         //         ),
              //         //       ],
              //         //     ),
              //         //     Expanded(
              //         //         flex: 2,
              //         //         child: Text(
              //         //           '${notifier.portData.services?[index].description}',
              //         //           maxLines: 4,
              //         //         )),
              //         //     Expanded(
              //         //         flex: 1,
              //         //         child: Image.network(
              //         //             'https:bensalcie.payherokenya.com/portal/images/${notifier.portData.services?[index].image}'))
              //         //   ],
              //         // ),
              //         ),
              //   ),
              // );

              // Text('${notifier.portData.services?[index].description}');
            },
            itemCount: notifier.portData.services?.length);
      }),
    );
  }
}
