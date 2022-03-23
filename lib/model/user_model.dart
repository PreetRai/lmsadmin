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

  String? employeename;
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
    this.employeename,
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
        employee: map['employee'],
        employeename: map['employeename']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'employeename': employeename,
      'employee': employee,
      'contactby': contactby,
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

class PropertyModel {
  String? cid;
  String? pid;
  String? addressone;
  String? addresstwo;
  String? category;
  String? type;
  String? subtype;
  String? contractor;
  String? architect;
  String? supervisor;
  String? details;
  String? supervisorphn;
  String? contractorphn;
  String? architectphn;

  PropertyModel(
      {this.cid,
      this.pid,
      this.addressone,
      this.addresstwo,
      this.category,
      this.type,
      this.subtype,
      this.contractor,
      this.architect,
      this.supervisor,
      this.details,
      this.architectphn,
      this.contractorphn,
      this.supervisorphn});

  // receiving data from server
  factory PropertyModel.fromMap(map) {
    return PropertyModel(
      cid: map['cid'],
      pid: map['pid'],
      category: map['category'],
      type: map['type'],
      subtype: map['subtype'],
      addressone: map['addressone'],
      addresstwo: map['addresstwo'],
      contractor: map['contractor'],
      architect: map['architect'],
      supervisor: map['supervisor'],
      details: map['details'],
      architectphn: map['architectphn'],
      contractorphn: map['contractorphn'],
      supervisorphn: map['supervisorphn'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'cid': cid,
      'pid': pid,
      'category': category,
      'type': type,
      'subtype': subtype,
      'addressone': addressone,
      'addresstwo': addresstwo,
      'contractor': contractor,
      'architect': architect,
      'supervisor': supervisor,
      'details': details,
      'architectphn': architectphn,
      'contractorphn': contractorphn,
      'supervisorphn': supervisorphn,
    };
  }
}
