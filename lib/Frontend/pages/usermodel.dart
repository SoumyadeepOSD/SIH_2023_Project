class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? location;
  String? registerId;
  String? phoneName;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.registerId,
    required this.phoneName,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'location': location,
        'registerId': registerId,
        'phoneName': phoneName,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        location: json['location'],
        registerId: json['registerId'],
        phoneName: json['phone'],
      );
}

// Distributor's model
class DistributorModel {
  String? id;
  String? firstName;
  String? lastName;
  String? location;
  String? registerId;
  String? phoneNumber;
  String? type;

  DistributorModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.registerId,
    required this.phoneNumber,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'location': location,
        'registerId': registerId,
        'phoneNumber': phoneNumber,
        'type': type
      };

  static DistributorModel fromJson(Map<String, dynamic> json) =>
      DistributorModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        location: json['location'],
        registerId: json['registerId'],
        phoneNumber: json['phoneNumber'],
        type: json['type'],
      );
}
