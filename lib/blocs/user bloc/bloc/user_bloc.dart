import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_state.dart';
 
part 'user_bloc_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserDefault()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
