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
  List<Object?> get props => [data, message,];
}


class UserDefault extends UserState {}

class UserLoginLoading extends UserState {
    const UserLoginLoading(): super();
}

class UserLoginSuccess extends UserState {
    const UserLoginSuccess({UserModel? data}): super(data: data);
}

class UserLoginFailed extends UserState {
    const UserLoginFailed({String? message}): super(message: message);
}

class UserSignupLoading extends UserState {
    const UserSignupLoading(): super();
}

class UserSignupSuccess extends UserState {
    const UserSignupSuccess({String? message}): super(message: message);
}

class UserSignupFailed extends UserState {
    const UserSignupFailed({String? message}): super(message: message);
}