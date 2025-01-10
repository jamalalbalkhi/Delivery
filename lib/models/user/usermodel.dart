class UserModel {
  final int Id;
  final String name;
  final String phone;
  UserModel ({
    required this.Id,
    required this.name,
    required this.phone,
  }
      );
}
class User {
  var id;
  var firstName;
  var lastName;
  var phoneNumber;
  var location;
  var profilePicture;
  var email;
  var emailVerifiedAt;
  var role;
  var createdAt;
  var updatedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.location,
        this.profilePicture,
        this.email,
        this.emailVerifiedAt,
        this.role,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    location = json['location'];
    profilePicture = json['profile_picture'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['location'] = this.location;
    data['profile-picture'] = this.profilePicture;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
