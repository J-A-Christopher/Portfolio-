import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import 'package:http/http.dart' as http;
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  Widget build(BuildContext context) {
    return
        // appBar: AppBar(
        //   title: const Text('Hello World'),
        // ),
        FutureBuilder<Profile>(
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
    );
  }
}
