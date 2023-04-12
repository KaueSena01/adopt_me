import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';

class UserDTO extends UserEntity {
  UserDTO({
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
}
