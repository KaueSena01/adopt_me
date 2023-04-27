import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';

class UserDTO extends UserEntity {
  const UserDTO({
    String uid = "",
    String name = "",
    String email = "",
    String aboutMe = "",
    String location = "",
    String profileUrl = "",
  }) : super(
          uid: uid,
          name: name,
          email: email,
          aboutMe: aboutMe,
          location: location,
          profileUrl: profileUrl,
        );

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "aboutMe": aboutMe,
      "location": location,
      "profileUrl": profileUrl,
      "uid": uid,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      aboutMe: map['aboutMe'] ?? '',
      location: map['location'] ?? '',
      profileUrl: map['profileUrl'] ?? '',
    );
  }
}
