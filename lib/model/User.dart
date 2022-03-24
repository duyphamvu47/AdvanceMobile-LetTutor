class User {
  User? user;

  User({this.user});

  User.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  Null? language;
  String? birthday;
  bool? isActivated;
  Null? tutorInfo;
  WalletInfo? walletInfo;
  List<Null>? feedbacks;
  List<Null>? courses;
  Null? requireNote;
  String? level;
  List<Null>? learnTopics;
  List<Null>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;
  ReferralInfo? referralInfo;
  int? avgRating;
  PriceOfEachSession? priceOfEachSession;

  User(
      {this.id,
        this.email,
        this.name,
        this.avatar,
        this.country,
        this.phone,
        this.roles,
        this.language,
        this.birthday,
        this.isActivated,
        this.tutorInfo,
        this.walletInfo,
        this.feedbacks,
        this.courses,
        this.requireNote,
        this.level,
        this.learnTopics,
        this.testPreparations,
        this.isPhoneActivated,
        this.timezone,
        this.referralInfo,
        this.avgRating,
        this.priceOfEachSession});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    roles = json['roles'].cast<String>();
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    tutorInfo = json['tutorInfo'];
    walletInfo = json['walletInfo'] != null
        ? new WalletInfo.fromJson(json['walletInfo'])
        : null;
    if (json['feedbacks'] != null) {
      feedbacks = <Null>[];
      json['feedbacks'].forEach((v) {
        feedbacks!.add(new Null.fromJson(v));
      });
    }
    if (json['courses'] != null) {
      courses = <Null>[];
      json['courses'].forEach((v) {
        courses!.add(new Null.fromJson(v));
      });
    }
    requireNote = json['requireNote'];
    level = json['level'];
    if (json['learnTopics'] != null) {
      learnTopics = <Null>[];
      json['learnTopics'].forEach((v) {
        learnTopics!.add(new Null.fromJson(v));
      });
    }
    if (json['testPreparations'] != null) {
      testPreparations = <Null>[];
      json['testPreparations'].forEach((v) {
        testPreparations!.add(new Null.fromJson(v));
      });
    }
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    referralInfo = json['referralInfo'] != null
        ? new ReferralInfo.fromJson(json['referralInfo'])
        : null;
    avgRating = json['avgRating'];
    priceOfEachSession = json['priceOfEachSession'] != null
        ? new PriceOfEachSession.fromJson(json['priceOfEachSession'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['roles'] = this.roles;
    data['language'] = this.language;
    data['birthday'] = this.birthday;
    data['isActivated'] = this.isActivated;
    data['tutorInfo'] = this.tutorInfo;
    if (this.walletInfo != null) {
      data['walletInfo'] = this.walletInfo!.toJson();
    }
    if (this.feedbacks != null) {
      data['feedbacks'] = this.feedbacks!.map((v) => v.toJson()).toList();
    }
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    data['requireNote'] = this.requireNote;
    data['level'] = this.level;
    if (this.learnTopics != null) {
      data['learnTopics'] = this.learnTopics!.map((v) => v.toJson()).toList();
    }
    if (this.testPreparations != null) {
      data['testPreparations'] =
          this.testPreparations!.map((v) => v.toJson()).toList();
    }
    data['isPhoneActivated'] = this.isPhoneActivated;
    data['timezone'] = this.timezone;
    if (this.referralInfo != null) {
      data['referralInfo'] = this.referralInfo!.toJson();
    }
    data['avgRating'] = this.avgRating;
    if (this.priceOfEachSession != null) {
      data['priceOfEachSession'] = this.priceOfEachSession!.toJson();
    }
    return data;
  }
}

class WalletInfo {
  String? id;
  String? userId;
  String? amount;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  int? bonus;

  WalletInfo(
      {this.id,
        this.userId,
        this.amount,
        this.isBlocked,
        this.createdAt,
        this.updatedAt,
        this.bonus});

  WalletInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    amount = json['amount'];
    isBlocked = json['isBlocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['amount'] = this.amount;
    data['isBlocked'] = this.isBlocked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['bonus'] = this.bonus;
    return data;
  }
}

class ReferralInfo {
  int? id;
  String? referralCode;
  String? userId;
  int? referralPackId;
  String? createdAt;
  String? updatedAt;
  ReferralPackInfo? referralPackInfo;

  ReferralInfo(
      {this.id,
        this.referralCode,
        this.userId,
        this.referralPackId,
        this.createdAt,
        this.updatedAt,
        this.referralPackInfo});

  ReferralInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referralCode = json['referralCode'];
    userId = json['userId'];
    referralPackId = json['referralPackId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    referralPackInfo = json['referralPackInfo'] != null
        ? new ReferralPackInfo.fromJson(json['referralPackInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referralCode'] = this.referralCode;
    data['userId'] = this.userId;
    data['referralPackId'] = this.referralPackId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.referralPackInfo != null) {
      data['referralPackInfo'] = this.referralPackInfo!.toJson();
    }
    return data;
  }
}

class ReferralPackInfo {
  int? id;
  int? earnPercent;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  ReferralPackInfo(
      {this.id,
        this.earnPercent,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  ReferralPackInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    earnPercent = json['earnPercent'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['earnPercent'] = this.earnPercent;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class PriceOfEachSession {
  String? id;
  String? key;
  String? price;
  String? createdAt;
  String? updatedAt;

  PriceOfEachSession(
      {this.id, this.key, this.price, this.createdAt, this.updatedAt});

  PriceOfEachSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['price'] = this.price;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
