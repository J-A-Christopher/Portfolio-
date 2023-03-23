class TourCarousel {
  late List<Data> data;

  TourCarousel({required this.data});

  TourCarousel.fromJson(Map<String, dynamic> json) {
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
  late String title;
  late String image;
  late String date;
  late String description;
  late String countViews;
  late String countLikes;
  late Null video;

  Data(
      {required this.id,
      required this.title,
      required this.image,
      required this.date,
      required this.description,
      required this.countViews,
      required this.countLikes,
      required this.video});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    date = json['date'];
    description = json['description'];
    countViews = json['count_views'];
    countLikes = json['count_likes'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['date'] = this.date;
    data['description'] = this.description;
    data['count_views'] = this.countViews;
    data['count_likes'] = this.countLikes;
    data['video'] = this.video;
    return data;
  }
}
