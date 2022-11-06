import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchState(flag: false));
  void toggleSwicth() {
    if (state.flag == false) {
      emit(SwitchState(flag: true));
    } else {
      emit(SwitchState(flag: false));
    }
  }
}
