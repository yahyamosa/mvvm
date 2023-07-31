import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const User({this.userId, this.id, this.title, this.body});

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  @override
  List<Object?> get props => [userId, id, title, body];
}
