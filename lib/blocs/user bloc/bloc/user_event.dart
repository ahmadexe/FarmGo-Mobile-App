// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserSignup extends UserEvent {
  final String username; 
  final String contact; 
  final String name;
  final String email;
  final String password; 
  final bool isInvestor;
  const UserSignup({
    required this.username,
    required this.contact,
    required this.name,
    required this.email,
    required this.password,
    required this.isInvestor,
  });
}

class UserLogin extends UserEvent {
  final String email;
  final String password;
  final bool isInvestor;
  const UserLogin({
    required this.email,
    required this.password,
    required this.isInvestor,
  });
}

class UserLogout extends UserEvent {}

class CheckAuthStatus extends UserEvent {}