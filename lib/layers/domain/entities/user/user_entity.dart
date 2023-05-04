import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String aboutMe;
  final String location;
  final String profileUrl;

  const UserEntity({
    this.uid = "",
    this.name = "",
    this.email = "",
    this.phone = "",
    this.password = "",
    this.aboutMe = "",
    this.location = "",
    this.profileUrl = "",
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        phone,
        password,
        aboutMe,
        location,
        profileUrl,
      ];
}
