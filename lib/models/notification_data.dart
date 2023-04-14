class NotificationsDta {
  String? backimage;
  String? profile;
  int? projects;
  int? stars;
  List<Notifications>? notifications;

  NotificationsDta(
      {this.backimage,
      this.profile,
      this.projects,
      this.stars,
      this.notifications});

  NotificationsDta.fromJson(Map<String, dynamic> json) {
    backimage = json['backimage'];
    profile = json['profile'];
    projects = json['projects'];
    stars = json['stars'];
    if (json['Notifications'] != null) {
      notifications = <Notifications>[];
      json['Notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backimage'] = backimage;
    data['profile'] = profile;
    data['projects'] = projects;
    data['stars'] = stars;
    if (notifications != null) {
      data['Notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String? date;
  String? description;
  String? title;

  Notifications({this.date, this.description, this.title});

  Notifications.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['description'] = description;
    data['title'] = title;
    return data;
  }
}
