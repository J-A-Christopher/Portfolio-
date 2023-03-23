import 'dart:convert';

import 'package:flutter/material.dart';
import './models/profile_model.dart';
import 'package:http/http.dart' as http;
import './widgets/profile_widget.dart';
import 'providers/tour_carousel_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Profile> getProfileData() async {
    final response = await http.get(
        Uri.parse('https://bensalcie.payherokenya.com/portal/api/profile.php'));
    if (response.statusCode == 200) {
      // print(response);
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Load Album');
    }
  }

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tcarousel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // appBar: AppBar(
            //   title: const Text('Hello World'),
            // ),
            body: FutureBuilder<Profile>(
          future: getProfileData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Data> userProfile = snapshot.data?.data as List<Data>;
              return ProfileWidget(
                usData: userProfile,
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          },
        )),
      ),
    );
  }
}
