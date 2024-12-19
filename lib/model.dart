class User {
  final int UserId;
  final String UserName;
  final String UserAddress;

  const User({
    required this.UserId,
    required this.UserName,
    required this.UserAddress,
  });

  factory User.fromJson(Map<String, dynamic>  json) => User(
    UserId: json['UserId'],
    UserName: json['UserName'],
    UserAddress: json['UserAddress'],
);

Map<String, dynamic> toJson()=>{
  "UserId" : UserId,
  "UserName" : UserName,
  "UserAddress" : UserAddress,
  };
}