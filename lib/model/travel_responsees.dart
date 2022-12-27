import 'dart:convert';

TravelResponse getTravelResponseModelFromJson(String str) => TravelResponse.fromJson(json.decode(str));
String getTravelResponseModelToJson(TravelResponse data) => json.encode(data.toJson());

String getTravelResponseModelDataToString(dynamic data) => json.encode(data);
dynamic getTravelResponseModelDataToJson(String data) => json.decode(data);


List<Close> getCloseListFromJson(String str) =>
    List<Close>.from(
        json.decode(str).map((x) => Close.fromJson(x)));

String getCloseListToJson(List<Close> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Close closeModelFromJson(String str) =>
    Close.fromJson(json.decode(str));
String closeModelToJson(Close data) => json.encode(data.toJson());

String closeModelDataToString(dynamic data) => json.encode(data);
dynamic closeModelDataToJson(String data) => json.decode(data);

List<Famous> getFamousListFromJson(String str) =>
    List<Famous>.from(
        json.decode(str).map((x) => Famous.fromJson(x)));

String getFamousListToJson(List<Famous> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Famous famousModelFromJson(String str) =>
    Famous.fromJson(json.decode(str));
String famousModelToJson(Famous data) => json.encode(data.toJson());

String famousModelDataToString(dynamic data) => json.encode(data);
dynamic famousModelDataToJson(String data) => json.decode(data);

class TravelResponse {
  bool? status;
  String? message;
  Data? data;

  TravelResponse({this.status, this.message, this.data});

  TravelResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Close>? nearby;
  List<Famous>? popular;

  Data({this.nearby, this.popular});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['nearby'] != null) {
      nearby = <Close>[];
      json['nearby'].forEach((v) {
        nearby!.add(new Close.fromJson(v));
      });
    }
    if (json['popular'] != null) {
      popular = <Famous>[];
      json['popular'].forEach((v) {
        popular!.add(new Famous.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nearby != null) {
      data['nearby'] = this.nearby!.map((v) => v.toJson()).toList();
    }
    if (this.popular != null) {
      data['popular'] = this.popular!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Close {
  int? id;
  String? name;
  String? description;
  String? location;
  double? price;
  int? min;
  String? active;
  Null? routeVideoId;
  Null? language;
  Null? coverImage;
  int? stepcount;
  int? duration;
  int? distance;
  bool? trashed;
  int? averageRating;
  bool? isFavourite;
  Author? author;
  Travelmethod? travelmethod;
  List<Steps>? steps;
  List<Null>? categories;
  List<Images>? images;
  Null? audio;

  Close(
      {this.id,
        this.name,
        this.description,
        this.location,
        this.price,
        this.min,
        this.active,
        this.routeVideoId,
        this.language,
        this.coverImage,
        this.stepcount,
        this.duration,
        this.distance,
        this.trashed,
        this.averageRating,
        this.isFavourite,
        this.author,
        this.travelmethod,
        this.steps,
        this.categories,
        this.images,
        this.audio});

  Close.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    location = json['location'];
    price = json['price'];
    min = json['min'];
    active = json['active'];
    routeVideoId = json['route_video_id'];
    language = json['language'];
    coverImage = json['cover_image'];
    stepcount = json['stepcount'];
    duration = json['duration'];
    distance = json['distance'];
    trashed = json['trashed'];
    averageRating = json['average_rating'];
    isFavourite = json['is_favourite'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    travelmethod = json['travelmethod'] != null
        ? new Travelmethod.fromJson(json['travelmethod'])
        : null;
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(new Steps.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      // categories = <Categories>[];
      // json['categories'].forEach((v) {
      //   categories!.add(new Categories.fromJson(v));
      // });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['location'] = this.location;
    data['price'] = this.price;
    data['min'] = this.min;
    data['active'] = this.active;
    data['route_video_id'] = this.routeVideoId;
    data['language'] = this.language;
    data['cover_image'] = this.coverImage;
    data['stepcount'] = this.stepcount;
    data['duration'] = this.duration;
    data['distance'] = this.distance;
    data['trashed'] = this.trashed;
    data['average_rating'] = this.averageRating;
    data['is_favourite'] = this.isFavourite;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.travelmethod != null) {
      data['travelmethod'] = this.travelmethod!.toJson();
    }
    if (this.steps != null) {
      data['steps'] = this.steps!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      // data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['audio'] = this.audio;
    return data;
  }
}

class Author {
  int? id;
  String? username;
  String? email;
  String? birthday;
  String? location;
  String? description;
  String? hobbies;
  String? job;
  String? imgPath;
  Null? appleId;
  Null? googleId;
  int? otp;
  String? otpExpiry;
  int? isVerified;
  String? active;
  String? stripeCustomerId;
  List<int>? routesStarredIds;
  Level? level;

  Author(
      {this.id,
        this.username,
        this.email,
        this.birthday,
        this.location,
        this.description,
        this.hobbies,
        this.job,
        this.imgPath,
        this.appleId,
        this.googleId,
        this.otp,
        this.otpExpiry,
        this.isVerified,
        this.active,
        this.stripeCustomerId,
        this.routesStarredIds,
        this.level});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    birthday = json['birthday'];
    location = json['location'];
    description = json['description'];
    hobbies = json['hobbies'];
    job = json['job'];
    imgPath = json['img_path'];
    appleId = json['apple_id'];
    googleId = json['google_id'];
    otp = json['otp'];
    otpExpiry = json['otp_expiry'];
    isVerified = json['is_verified'];
    active = json['active'];
    stripeCustomerId = json['stripe_customer_id'];
    routesStarredIds = json['routes_starred_ids'].cast<int>();
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['birthday'] = this.birthday;
    data['location'] = this.location;
    data['description'] = this.description;
    data['hobbies'] = this.hobbies;
    data['job'] = this.job;
    data['img_path'] = this.imgPath;
    data['apple_id'] = this.appleId;
    data['google_id'] = this.googleId;
    data['otp'] = this.otp;
    data['otp_expiry'] = this.otpExpiry;
    data['is_verified'] = this.isVerified;
    data['active'] = this.active;
    data['stripe_customer_id'] = this.stripeCustomerId;
    data['routes_starred_ids'] = this.routesStarredIds;
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    return data;
  }
}

class Level {
  int? id;
  String? description;

  Level({this.id, this.description});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
}

class Travelmethod {
  int? id;
  String? name;

  Travelmethod({this.id, this.name});

  Travelmethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Steps {
  int? id;
  int? routeId;
  int? routeTravelmethodId;
  int? order;
  String? description;
  int? isStart;
  int? isFinish;
  int? distance;
  int? duration;
  Geopos? geopos;
  double? locLat;
  double? locLong;
  List<Audios>? audios;
  Travelmethod? travelmethod;

  Steps(
      {this.id,
        this.routeId,
        this.routeTravelmethodId,
        this.order,
        this.description,
        this.isStart,
        this.isFinish,
        this.distance,
        this.duration,
        this.geopos,
        this.locLat,
        this.locLong,
        this.audios,
        this.travelmethod});

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    routeId = json['route_id'];
    routeTravelmethodId = json['route_travelmethod_id'];
    order = json['order'];
    description = json['description'];
    isStart = json['is_start'];
    isFinish = json['is_finish'];
    distance = json['distance'];
    duration = json['duration'];
    geopos =
    json['geopos'] != null ? new Geopos.fromJson(json['geopos']) : null;
    locLat = json['loc_lat'];
    locLong = json['loc_long'];
    if (json['audios'] != null) {
      audios = <Audios>[];
      json['audios'].forEach((v) {
        audios!.add(new Audios.fromJson(v));
      });
    }
    travelmethod = json['travelmethod'] != null
        ? new Travelmethod.fromJson(json['travelmethod'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['route_id'] = this.routeId;
    data['route_travelmethod_id'] = this.routeTravelmethodId;
    data['order'] = this.order;
    data['description'] = this.description;
    data['is_start'] = this.isStart;
    data['is_finish'] = this.isFinish;
    data['distance'] = this.distance;
    data['duration'] = this.duration;
    if (this.geopos != null) {
      data['geopos'] = this.geopos!.toJson();
    }
    data['loc_lat'] = this.locLat;
    data['loc_long'] = this.locLong;
    if (this.audios != null) {
      data['audios'] = this.audios!.map((v) => v.toJson()).toList();
    }
    if (this.travelmethod != null) {
      data['travelmethod'] = this.travelmethod!.toJson();
    }
    return data;
  }
}

class Geopos {
  String? type;
  List<double>? coordinates;

  Geopos({this.type, this.coordinates});

  Geopos.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Audios {
  int? id;
  int? routeStepId;
  String? name;
  String? path;
  String? runtime;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Audios(
      {this.id,
        this.routeStepId,
        this.name,
        this.path,
        this.runtime,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Audios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    routeStepId = json['route_step_id'];
    name = json['name'];
    path = json['path'];
    runtime = json['runtime'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['route_step_id'] = this.routeStepId;
    data['name'] = this.name;
    data['path'] = this.path;
    data['runtime'] = this.runtime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Images {
  int? id;
  String? path;

  Images({this.id, this.path});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}

class Famous {
  int? id;
  String? name;
  String? description;
  String? location;
  double? price;
  int? min;
  String? active;
  Null? routeVideoId;
  Null? language;
  Null? coverImage;
  int? stepcount;
  int? duration;
  int? distance;
  bool? trashed;
  double? averageRating;
  bool? isFavourite;
  Author? author;
  Travelmethod? travelmethod;
  List<Steps>? steps;
  List<Null>? categories;
  List<Images>? images;
  Audios? audio;

  Famous(
      {this.id,
        this.name,
        this.description,
        this.location,
        this.price,
        this.min,
        this.active,
        this.routeVideoId,
        this.language,
        this.coverImage,
        this.stepcount,
        this.duration,
        this.distance,
        this.trashed,
        this.averageRating,
        this.isFavourite,
        this.author,
        this.travelmethod,
        this.steps,
        this.categories,
        this.images,
        this.audio});

  Famous.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    location = json['location'];
    price = json['price'];
    min = json['min'];
    active = json['active'];
    routeVideoId = json['route_video_id'];
    language = json['language'];
    coverImage = json['cover_image'];
    stepcount = json['stepcount'];
    duration = json['duration'];
    distance = json['distance'];
    trashed = json['trashed'];
    averageRating = json['average_rating'];
    isFavourite = json['is_favourite'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    travelmethod = json['travelmethod'] != null
        ? new Travelmethod.fromJson(json['travelmethod'])
        : null;
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(new Steps.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      // categories = <Categories>[];
      // json['categories'].forEach((v) {
      //   categories!.add(new Categories.fromJson(v));
      // });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    audio = json['audio'] != null ? new Audios.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['location'] = this.location;
    data['price'] = this.price;
    data['min'] = this.min;
    data['active'] = this.active;
    data['route_video_id'] = this.routeVideoId;
    data['language'] = this.language;
    data['cover_image'] = this.coverImage;
    data['stepcount'] = this.stepcount;
    data['duration'] = this.duration;
    data['distance'] = this.distance;
    data['trashed'] = this.trashed;
    data['average_rating'] = this.averageRating;
    data['is_favourite'] = this.isFavourite;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.travelmethod != null) {
      data['travelmethod'] = this.travelmethod!.toJson();
    }
    if (this.steps != null) {
      data['steps'] = this.steps!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      // data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.audio != null) {
      data['audio'] = this.audio!.toJson();
    }
    return data;
  }
}