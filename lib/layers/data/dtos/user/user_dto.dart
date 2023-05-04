import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';

class UserDTO extends UserEntity {
  const UserDTO({
    String uid = "",
    String name = "",
    String email = "",
    String phone = "",
    String aboutMe = "",
    String location = "",
    String profileUrl = "",
  }) : super(
          uid: uid,
          name: name,
          email: email,
          phone: phone,
          aboutMe: aboutMe,
          location: location,
          profileUrl: profileUrl,
        );

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phone": phone,
      "aboutMe": aboutMe,
      "location": location,
      "profileUrl": profileUrl,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      aboutMe: map['aboutMe'] ?? '',
      location: map['location'] ?? '',
      profileUrl: map['profileUrl'] ?? '',
    );
  }
}
