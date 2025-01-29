class User {
  final String username;
  final String password;
  final String fullName;
  final String dni;
  final String phoneNumber;
  final String address;
  final String email;
  final List<String> roleListName;

  User({
    required this.username,
    required this.password,
    required this.fullName,
    required this.dni,
    required this.phoneNumber,
    required this.address,
    required this.email,
    required this.roleListName,
  });

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      fullName: json['fullName'],
      dni: json['dni'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      email: json['email'],
      roleListName: List<String>.from(json['roleRequest']['roleListName']),
    );
  }

  // Method to convert a User to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'fullName': fullName,
      'dni': dni,
      'phoneNumber': phoneNumber,
      'address': address,
      'email': email,
      'roleRequest': {
        'roleListName': roleListName,
      },
    };
  }
}