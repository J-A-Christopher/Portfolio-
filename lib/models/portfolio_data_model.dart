class PortfolioData {
  List<Services>? services;

  PortfolioData({this.services});

  PortfolioData.fromJson(Map<String, dynamic> json) {
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
  String? image;
  String? date;
  String? description;
  String? slug;
  String? linkToContent;
  dynamic rating;

  Services(
      {this.id,
      this.title,
      this.image,
      this.date,
      this.description,
      this.slug,
      this.linkToContent,
      this.rating});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    date = json['date'];
    description = json['description'];
    slug = json['slug'];
    linkToContent = json['link_to_content'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['date'] = date;
    data['description'] = description;
    data['slug'] = slug;
    data['link_to_content'] = linkToContent;
    data['rating'] = rating;
    return data;
  }
}
