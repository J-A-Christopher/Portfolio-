class Profile {
  late List<Data> data;

  Profile({required this.data});

  Profile.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  late String id;
  late String name;
  late String role;
  late String headerImage;
  late String sliderOne;
  dynamic sliderTwo;
  dynamic slideThree;
  dynamic sliderFour;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['header_image'] = headerImage;
    data['slider_one'] = sliderOne;
    data['slider_two'] = sliderTwo;
    data['slide_three'] = slideThree;
    data['slider_four'] = sliderFour;
    data['description'] = description;
    data['date_updtated'] = dateUpdtated;
    return data;
  }
}
