import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final String aboutMe;
  final String location;
  final String profileUrl;
  final String uid;

  const UserEntity({
    this.name = "",
    this.email = "",
    this.password = "",
    this.aboutMe = "",
    this.location = "",
    this.profileUrl = "",
    this.uid = "",
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        password,
        aboutMe,
        location,
        profileUrl,
      ];
}
