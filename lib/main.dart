import 'package:cj_app/widgets/introScreen.dart';
import 'package:flutter/material.dart';
import 'providers/tour_carousel_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Future<Profile> getProfileData() async {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tcarousel(),
      child: MaterialApp(
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          home: const IntroductionScreen()

          //  Scaffold(
          //     // appBar: AppBar(
          //     //   title: const Text('Hello World'),
          //     // ),
          //     body:

          //      FutureBuilder<Profile>(
          //   future: getProfileData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       List<Data> userProfile = snapshot.data?.data as List<Data>;
          //       return ProfileWidget(
          //         usData: userProfile,
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //     return const Center(
          //       child: CircularProgressIndicator(
          //         color: Colors.blue,
          //       ),
          //     );
          //   },
          // )),
          ),
    );
  }
}
