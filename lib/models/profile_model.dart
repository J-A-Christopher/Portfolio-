import 'package:flutter/material.dart';

class Profile {
  late List<Data> data;

  Profile({required this.data});

  Profile.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late String id;
  late String name;
  late String role;
  late String headerImage;
  late String sliderOne;
  Null sliderTwo;
  Null slideThree;
  Null sliderFour;
  late String description;
  late String dateUpdtated;

  Data(
      {required this.id,
      required this.name,
      required this.role,
      required this.headerImage,
      required this.sliderOne,
      this.sliderTwo,
      this.slideThree,
      this.sliderFour,
      required this.description,
      required this.dateUpdtated});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    headerImage = json['header_image'];
    sliderOne = json['slider_one'];
    sliderTwo = json['slider_two'];
    slideThree = json['slide_three'];
    sliderFour = json['slider_four'];
    description = json['description'];
    dateUpdtated = json['date_updtated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['header_image'] = this.headerImage;
    data['slider_one'] = this.sliderOne;
    data['slider_two'] = this.sliderTwo;
    data['slide_three'] = this.slideThree;
    data['slider_four'] = this.sliderFour;
    data['description'] = this.description;
    data['date_updtated'] = this.dateUpdtated;
    return data;
  }
}
