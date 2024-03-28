class UserModel {
  String fullName;
  String username;
  String password;
  late String email;
  String dob;
  String contactNumber;
  String streetName;
  String area;
  String city;
  String state;
  String wardNumber;
  String role;

  UserModel({
    required this.fullName,
    required this.username,
    required this.password,
    required this.email,
    required this.dob,
    required this.contactNumber,
    required this.streetName,
    required this.area,
    required this.city,
    required this.state,
    required this.wardNumber,
    required this.role,
  });
}

UserModel user = UserModel(
  fullName: 'Baburam Nabik',
  username: 'babu',
  password: 'test',
  email: 'babu@example.com',
  dob: '14/10/1998',
  contactNumber: '9876543210',
  streetName: 'Another Street',
  area: 'Another Area',
  city: 'Another City',
  state: 'Another State',
  wardNumber: '456',
  role: 'sppl',
);
