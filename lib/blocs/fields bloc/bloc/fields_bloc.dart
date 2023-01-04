import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fields_event.dart';
part 'fields_state.dart';

class FieldsBloc extends Bloc<FieldsEvent, FieldsState> {
  FieldsBloc() : super(FieldsInitial()) {
    on<FieldsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
