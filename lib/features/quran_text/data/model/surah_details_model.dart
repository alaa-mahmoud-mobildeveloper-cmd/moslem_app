class SurahDetailsModel {
  int? code;
  String? status;
  Data? data;

  SurahDetailsModel({this.code, this.status, this.data});

  SurahDetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['code'] = code;
    jsonMap['status'] = status;
    if (data != null) {
      jsonMap['data'] = data!.toJson();
    }
    return jsonMap;
  }
}

class Data {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;
  List<Ayahs>? ayahs;
  Edition? edition;

  Data({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
    this.edition,
  });

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(Ayahs.fromJson(v));
      });
    }
    edition = json['edition'] != null ? Edition.fromJson(json['edition']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['number'] = number;
    jsonMap['name'] = name;
    jsonMap['englishName'] = englishName;
    jsonMap['englishNameTranslation'] = englishNameTranslation;
    jsonMap['revelationType'] = revelationType;
    jsonMap['numberOfAyahs'] = numberOfAyahs;
    if (ayahs != null) {
      jsonMap['ayahs'] = ayahs!.map((v) => v.toJson()).toList();
    }
    if (edition != null) {
      jsonMap['edition'] = edition!.toJson();
    }
    return jsonMap;
  }
}

class Ayahs {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayahs({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];

    // الحل هنا: بنشيك لو القيمة اللي جاية عبارة عن Map، بنعتبرها true علطول
    if (json['sajda'] is Map) {
      sajda = true;
    } else {
      sajda = json['sajda']; // لو جاية false هتنزل false زي ما هي
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['number'] = number;
    jsonMap['text'] = text;
    jsonMap['numberInSurah'] = numberInSurah;
    jsonMap['juz'] = juz;
    jsonMap['manzil'] = manzil;
    jsonMap['page'] = page;
    jsonMap['ruku'] = ruku;
    jsonMap['hizbQuarter'] = hizbQuarter;
    jsonMap['sajda'] = sajda;
    return jsonMap;
  }
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  Edition.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['identifier'] = identifier;
    jsonMap['language'] = language;
    jsonMap['name'] = name;
    jsonMap['englishName'] = englishName;
    jsonMap['format'] = format;
    jsonMap['type'] = type;
    jsonMap['direction'] = direction;
    return jsonMap;
  }
}