class AdminModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? username;

  AdminModel(
      {this.uid, this.email, this.firstName, this.secondName, this.username});

  // receiving data from server
  factory AdminModel.fromMap(map) {
    return AdminModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName'],
        username: map['username']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'username': username,
    };
  }
}
