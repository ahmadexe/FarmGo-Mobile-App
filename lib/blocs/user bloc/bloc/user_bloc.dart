import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/repository.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_state.dart';
import 'package:farmgo/models/user_model.dart';
import 'package:farmgo/static/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_event.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc() : super(UserDefault()) {
    on<UserLogin>(_loginUser);
    on<UserSignup>(_signupUser);
    on<UserLogout>(_logout);
  }

  UserRepository repo = UserRepository();

  _logout(UserLogout event, Emitter<UserState> emit) async {
    try {
      await repo.logout();
      emit(UserDefault());
    } catch (e) {
      emit(UserDefault());
    }
  }

  void _loginUser(UserLogin event, Emitter<UserState> emit) async {
    emit(const UserLoginLoading());
    try {
      User response =
          await repo.login(event.email, event.password, event.isInvestor);
      UserModel user =
          await repo.getUserDetails(event.isInvestor, response.uid);
      emit(UserLoginSuccess(data: user));
    } catch (e) {
      emit(const UserLoginFailed(message: AppConstants.defaultErrorMessage));
    }
  }

  void _signupUser(UserSignup event, Emitter<UserState> emit) async {
    try {
      emit(const UserSignupLoading());
      String response = await repo.signup(event.username, event.contact,
          event.name, event.email, event.password, event.isInvestor);
      if (response == AppConstants.success) {
        emit(const UserSignupSuccess(
            message: "Congrats! You have successfully signed up"));
      } else {
        emit(UserSignupFailed(message: response));
      }
    } catch (e) {
      emit(const UserSignupFailed(message: AppConstants.defaultErrorMessage));
    }
  }
  
  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toMap();
  }
}
