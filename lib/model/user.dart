import 'dart:convert';

class User {
  final String username;
  final String password;
  
  final String createdBy;
  User({
    required this.username,
    required this.password,
    
    required this.createdBy,
  });

  User copyWith({
    String? username,
    String? password,
    
    String? createdBy,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
      
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      
      'createdBy': createdBy,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      
      createdBy: map['createdBy'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(username: $username, password: $password, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.username == username &&
      other.password == password &&
      
      other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      password.hashCode ^
      
      createdBy.hashCode;
  }
}

class UserRetrieve {
  final int userid;
  final String username;
  final String password;
  
  final String createdBy;
  UserRetrieve({
    required this.userid,
    required this.username,
    required this.password,
    
    required this.createdBy,
  });

  UserRetrieve copyWith({
    int? userid,
    String? username,
    String? password,
    
    String? createdBy,
  }) {
    return UserRetrieve(
      userid: userid ?? this.userid,
      username: username ?? this.username,
      password: password ?? this.password,
      
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'username': username,
      'password': password,
      
      'createdBy': createdBy,
    };
  }

  factory UserRetrieve.fromMap(Map<String, dynamic> map) {
    return UserRetrieve(
      userid: map['userid']?.toInt() ?? 0,
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      
      createdBy: map['createdBy'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRetrieve.fromJson(String source) =>
      UserRetrieve.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserRetrieve(userid: $userid, username: $username, password: $password,  createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRetrieve &&
        other.userid == userid &&
        other.username == username &&
        other.password == password &&
        
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return userid.hashCode ^
        username.hashCode ^
        password.hashCode ^
        
        createdBy.hashCode;
  }
}
