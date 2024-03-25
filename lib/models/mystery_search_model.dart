class MysterySearchModel {
  List<Businesses>? businesses;
  int? total;
  Region? region;

  MysterySearchModel({this.businesses, this.total, this.region});

  MysterySearchModel.fromJson(Map<String, dynamic> json) {
    if (json['businesses'] != null) {
      businesses = <Businesses>[];
      json['businesses'].forEach((v) {
        businesses!.add(new Businesses.fromJson(v));
      });
    }
    total = json['total'];
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.businesses != null) {
      data['businesses'] = this.businesses!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    return data;
  }
}

class Businesses {
  String? id;
  String? alias;
  String? name;
  String? imageUrl;
  bool? isClosed;
  String? url;
  int? reviewCount;
  List<Categories>? categories;
  double? rating;
  Coordinates? coordinates;
  List<String>? transactions;
  Location? location;
  String? phone;
  String? displayPhone;
  double? distance;
  Attributes? attributes;

  Businesses(
      {this.id,
      this.alias,
      this.name,
      this.imageUrl,
      this.isClosed,
      this.url,
      this.reviewCount,
      this.categories,
      this.rating,
      this.coordinates,
      this.transactions,
      this.location,
      this.phone,
      this.displayPhone,
      this.distance,
      this.attributes});

  Businesses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    name = json['name'];
    imageUrl = json['image_url'];
    isClosed = json['is_closed'];
    url = json['url'];
    reviewCount = json['review_count'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    rating = json['rating'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    transactions = json['transactions'].cast<String>();
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    phone = json['phone'];
    displayPhone = json['display_phone'];
    distance = json['distance'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alias'] = this.alias;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['is_closed'] = this.isClosed;
    data['url'] = this.url;
    data['review_count'] = this.reviewCount;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['rating'] = this.rating;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['transactions'] = this.transactions;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['phone'] = this.phone;
    data['display_phone'] = this.displayPhone;
    data['distance'] = this.distance;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Categories {
  String? alias;
  String? title;

  Categories({this.alias, this.title});

  Categories.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alias'] = this.alias;
    data['title'] = this.title;
    return data;
  }
}

class Coordinates {
  double? latitude;
  double? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Location {
  String? address1;
  String? address2;
  String? address3;
  String? city;
  String? zipCode;
  String? country;
  String? state;
  List<String>? displayAddress;

  Location(
      {this.address1,
      this.address2,
      this.address3,
      this.city,
      this.zipCode,
      this.country,
      this.state,
      this.displayAddress});

  Location.fromJson(Map<String, dynamic> json) {
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    city = json['city'];
    zipCode = json['zip_code'];
    country = json['country'];
    state = json['state'];
    displayAddress = json['display_address'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    data['country'] = this.country;
    data['state'] = this.state;
    data['display_address'] = this.displayAddress;
    return data;
  }
}

class Attributes {
  Null? businessTempClosed;
  String? menuUrl;
  Null? open24Hours;
  Null? waitlistReservation;

  Attributes(
      {this.businessTempClosed,
      this.menuUrl,
      this.open24Hours,
      this.waitlistReservation});

  Attributes.fromJson(Map<String, dynamic> json) {
    businessTempClosed = json['business_temp_closed'];
    menuUrl = json['menu_url'];
    open24Hours = json['open24_hours'];
    waitlistReservation = json['waitlist_reservation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_temp_closed'] = this.businessTempClosed;
    data['menu_url'] = this.menuUrl;
    data['open24_hours'] = this.open24Hours;
    data['waitlist_reservation'] = this.waitlistReservation;
    return data;
  }
}

class Region {
  Coordinates? center;

  Region({this.center});

  Region.fromJson(Map<String, dynamic> json) {
    center = json['center'] != null
        ? new Coordinates.fromJson(json['center'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.center != null) {
      data['center'] = this.center!.toJson();
    }
    return data;
  }
}
