import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/tour_carousel_model.dart';
import 'package:http/http.dart' as http;

class Tcarousel extends ChangeNotifier {
  // TourCarousel _images = TourCarousel(data: []);
  // TourCarousel get images => _images;
  List images = [];
  Future<List> getCarouselData() async {
    try {
      var response = await http.get(
          Uri.parse('https://bensalcie.payherokenya.com/portal/api/tour.php'));
      // print("Reponse :${response.statusCode}");

      if (response.statusCode == 200) {
        // _images = TourCarousel.fromJson(jsonDecode(response.body));
        // print("Reponse :${response.body}");

        final jsonResponse = jsonDecode(response.body);
        // print("jsonResponse: ${jsonResponse}");

        // images = {response.body['data']} as List<Data>;

        images = jsonResponse['data'] as List;
        notifyListeners();
      } else {
        throw Exception('Failed to Load Album');
      }
    } catch (error) {
      rethrow;
    }
    return images;
  }
}
