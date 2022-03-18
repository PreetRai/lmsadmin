class AdminModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? username;
  bool? isAdmin = true;
  AdminModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.username,
      this.isAdmin});

  // receiving data from server
  factory AdminModel.fromMap(map) {
    return AdminModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName'],
        username: map['username'],
        isAdmin: map['isadmin']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'username': username,
      'isAdmin': isAdmin,
    };
  }
}

class EmpModel {
  String? uid;
  String? firstName;
  String? secondName;
  String? jobTile;
  String? joiningDate;
  String? email;
  String? phone;
  String? address;
  String? username;

  bool? isAdmin;
  EmpModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.username,
      this.jobTile,
      this.address,
      this.joiningDate,
      this.phone,
      this.isAdmin});

  // receiving data from server
  factory EmpModel.fromMap(map) {
    return EmpModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName'],
        username: map['username'],
        jobTile: map['jobtitle'],
        address: map['address'],
        joiningDate: map['joiningdate'],
        phone: map['phone'],
        isAdmin: map['isAdmin']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'username': username,
      'jobtitle': jobTile,
      'address': address,
      'joiningdate': joiningDate,
      'phone': phone,
      'isAdmin': isAdmin,
    };
  }
}

class ContactsModel {
  String? cid;
  String? firstName;
  String? secondName;
  String? email;
  String? phone;
  String? addressone;
  String? addresstwo;
  String? contactby;
  String? employee;
  ContactsModel({
    this.cid,
    this.email,
    this.firstName,
    this.secondName,
    this.addressone,
    this.addresstwo,
    this.phone,
    this.contactby,
    this.employee,
  });

  // receiving data from server
  factory ContactsModel.fromMap(map) {
    return ContactsModel(
      cid: map['cid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      addressone: map['addressone'],
      addresstwo: map['addresstwo'],
      phone: map['phone'],
      contactby: map['contactby'],
      employee: map['employee']
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'employee':employee,
      'contactby':contactby,
      'cid': cid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'addressone': addressone,
      'addresstwo': addresstwo,
      'phone': phone,
    };
  }
}
