import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userId;
  String? name;
  String? surname;
  String? description;
  String? github;
  String? instagram;
  String? linkedin;
  String? email;
  String? phone;
  String? profilePhoto;
  DateTime? dateOfBirth;
  String? tcNo;
  String? country;
  String? city;
  String? address;
  String? education;

  UserModel({
    this.name,
    this.surname,
    this.description,
    this.github,
    this.instagram,
    this.linkedin,
    this.profilePhoto,
    this.userId,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.tcNo,
    this.country,
    this.city,
    this.address,
    this.education,
  });

  // ------------------------- (firestore bilgi çekme:) -------------------------
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] ?? "",
      name: map['name'] ?? "",
      surname: map['surname'] ?? "",
      description: map['description'] ?? "",
      github: map['github'] ?? "",
      instagram: map['instagram'] ?? "",
      linkedin: map['linkedin'] ?? "",
      profilePhoto: map['profilePhoto'] ?? "",
      dateOfBirth: (map['dateOfBirth'] as Timestamp?)?.toDate(),
      tcNo: map["tcNo"] ?? "",
      country: map['country'] ?? "",
      city: map['city'] ?? "",
      address: map['address'] ?? "",
      education: map['education'] ?? "",
    );
  }

  // ------------------------- (firestore bilgi gönderme:) -------------------------

  Map<String, dynamic> toMap() {
    final classMap = _createMap();
    final Map<String, dynamic> map = {};
    for (MapEntry<String, dynamic> entry in classMap.entries) {
      if (entry.value != null) {
        map.addEntries([entry]);
      }
    }
    return map;
  }

  // filtereleeme nin amacı: firestor'a null olanları kaydetme.

  Map<String, dynamic> _createMap() {
    return {
      'userId': userId,
      'email': email,
      'phone': phone,
      'name': name,
      'surname': surname,
      'description': description,
      'github': github,
      'instagram': instagram,
      'linkedin': linkedin,
      'profilePhoto': profilePhoto,
      'dateOfBirth': dateOfBirth,
      'tcNo': tcNo,
      'country': country,
      'city': city,
      'address': address,
      'education': education,
    };
  }

  UserModel copyWith({
    String? userId,
    String? name,
    String? surname,
    String? description,
    String? github,
    String? instagram,
    String? linkedin,
    String? email,
    String? phone,
    String? profilePhoto,
    DateTime? dateOfBirth,
    String? tcNo,
    String? country,
    String? city,
    String? address,
    String? education,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      description: description ?? this.description,
      github: github ?? this.github,
      instagram: instagram ?? this.instagram,
      linkedin: linkedin ?? this.linkedin,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      tcNo: tcNo ?? this.tcNo,
      country: country ?? this.country,
      city: city ?? this.city,
      address: address ?? this.address,
      education: education ?? this.education,
    );
  }
}
