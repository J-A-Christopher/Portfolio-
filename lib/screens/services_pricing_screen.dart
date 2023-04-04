import 'package:flutter/material.dart';
import '../providers/services_pricing_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/service_pricing_widget.dart';

class ServicesAndPricingScreen extends StatefulWidget {
  const ServicesAndPricingScreen({super.key});

  @override
  State<ServicesAndPricingScreen> createState() =>
      _ServicesAndPricingScreenState();
}

class _ServicesAndPricingScreenState extends State<ServicesAndPricingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration.zero).then((value) =>
    //     Provider.of<ServicesProvider>(context, listen: false)
    //         .getServPricingData());
    context.read<ServicesProvider>().getServPricingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Services & Pricing',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 2,
          backgroundColor: Colors.white,
          leading: const BackButton(
            color: Colors.black,
          ),
          actions: [
            PopupMenuButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                itemBuilder: (_) {
                  return [
                    const PopupMenuItem(
                      child: Text('Change Layout View'),
                    ),
                  ];
                })
          ],
        ),
        body: Consumer<ServicesProvider>(
          builder: (context, notifier, child) {
            // List<Services>? servPricing = notifier.servData as List<Services>;
            if (notifier.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return ServiceWidget(
                    image: notifier.servData.services?[index].image ?? '',
                    title: notifier.servData.services?[index].title ?? '',
                    description:
                        notifier.servData.services?[index].description ?? '');
              },
              itemCount: notifier.servData.services?.length,
            );

            // return Center(child: Text('${notifier.servData.services!.length}'));
          },
        ));
  }
}
