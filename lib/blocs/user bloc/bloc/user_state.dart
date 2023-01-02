// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../models/user_model.dart';

class UserState extends Equatable {
  final UserModel? data;
  final String? message;

  const UserState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.toMap(),
      'message': message,
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      data: map['data'] != null ? UserModel.fromMap(map['data'] as Map<String,dynamic>) : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) => UserState.fromMap(json.decode(source) as Map<String, dynamic>);
}

class UserDefault extends UserState {}

class UserLoginLoading extends UserState {
  const UserLoginLoading() : super();
}

class UserLoginSuccess extends UserState {
  const UserLoginSuccess({UserModel? data}) : super(data: data);
}

class UserLoginFailed extends UserState {
  const UserLoginFailed({String? message}) : super(message: message);
}

class UserSignupLoading extends UserState {
  const UserSignupLoading() : super();
}

class UserSignupSuccess extends UserState {
  const UserSignupSuccess({String? message}) : super(message: message);
}

class UserSignupFailed extends UserState {
  const UserSignupFailed({String? message}) : super(message: message);
}

class UserLogoutState extends UserState {
  const UserLogoutState() : super();
}
