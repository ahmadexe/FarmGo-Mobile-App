import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/repository.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_state.dart';
import 'package:farmgo/models/user_model.dart';
import 'package:farmgo/static/constants.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserDefault()) {
    on<UserLogin>(_loginUser);
    on<UserSignup>(_signupUser);
  }

  UserRepository repo = UserRepository();

  _loginUser(UserLogin event, Emitter<UserState> emit) async {
    try {
      emit(const UserLoginLoading());
      dynamic response =
          await repo.login(event.email, event.password, event.isInvestor);
      if (response == null) {
        emit(const UserLoginFailed(message: AppConstants.defaultErrorMessage));
      } else if (response is UserModel) {
        emit(UserLoginSuccess(data: response));
      }
    } catch (e) {
      emit(const UserLoginFailed(message: AppConstants.defaultErrorMessage));
    }
  }

  _signupUser(UserSignup event, Emitter<UserState> emit) async {
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
}
