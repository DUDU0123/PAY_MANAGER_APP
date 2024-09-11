import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  Name? userName;
  Picture? userProfileImage;
  Login? userLogin;
  String? email;

  UserModel({
    this.userName,
    this.userProfileImage,
    this.userLogin,this.email,
  });

  factory UserModel.fromJson({required Map<String, dynamic> map}) {
    return UserModel(
      userName: Name.fromJson(map['name']),
      userProfileImage: Picture.fromJson(map['picture']),
      userLogin: Login.fromJson(map['login']),
      email: map['email']
    );
  }

  @override
  List<Object?> get props => [userName, userProfileImage];
}

class Name {
  String title;
  String first;
  String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}

class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      uuid: json['uuid'],
      username: json['username'],
      password: json['password'],
      salt: json['salt'],
      md5: json['md5'],
      sha1: json['sha1'],
      sha256: json['sha256'],
    );
  }
}