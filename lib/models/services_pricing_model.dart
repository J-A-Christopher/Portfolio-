class ServAndPricing {
  List<Services>? services;

  ServAndPricing({this.services});

  ServAndPricing.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? id;
  String? title;
  String? description;
  String? image;
  String? imageTwo;
  String? imageThree;
  String? date;
  String? usingCurrently;
  String? category;
  String? costing;
  String? deliveryTime;

  Services(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.imageTwo,
      this.imageThree,
      this.date,
      this.usingCurrently,
      this.category,
      this.costing,
      this.deliveryTime});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    imageTwo = json['image_two'];
    imageThree = json['image_three'];
    date = json['date'];
    usingCurrently = json['using_currently'];
    category = json['category'];
    costing = json['costing'];
    deliveryTime = json['delivery_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['image_two'] = imageTwo;
    data['image_three'] = imageThree;
    data['date'] = date;
    data['using_currently'] = usingCurrently;
    data['category'] = category;
    data['costing'] = costing;
    data['delivery_time'] = deliveryTime;
    return data;
  }
}
