class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userRole;
  final String gender;
  final String profileImage;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.userRole,
      this.gender,
      this.profileImage});

  User.fromData(Map<String, dynamic> data)
      : id = data["id"],
        firstName = data["firstName"],
        lastName = data["lastName"],
        email = data["email"],
        gender = data["gender"],
        userRole = data["userRole"],
        profileImage = data["profileImage"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "userRole": userRole,
      "gender": gender,
      "profileImage": profileImage
    };
  }
}
