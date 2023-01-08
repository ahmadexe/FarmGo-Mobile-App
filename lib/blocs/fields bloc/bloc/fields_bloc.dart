import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farmgo/blocs/fields%20bloc/bloc/repository.dart';

import '../../../models/field.dart';
import 'add_field_state.dart';
import 'fetch_fields_state.dart';

part 'fields_event.dart';
part 'fields_state.dart';

class FieldsBloc extends Bloc<FieldsEvent, FieldsState> {
  FieldsBloc()
      : super(FieldsState(
          addFieldState: AddFieldDefault(),
          fetchFieldsState: FetchFieldDefault(),
        )) {
    on<FieldsEvent>(
      (event, emit) async {
        if (event is AddField) {
          await _addField(event, emit);
        } else if (event is FetchFields) {
          await _fetchFields(event, emit);
        }
      },
    );
  }

  final repo = FieldsRepository();

  _addField(AddField event, Emitter<FieldsState> emit) async {
    emit(state.copyWith(addFieldState: AddFieldLoading()));
    try {
      await repo.addAField(event.field);
      emit(state.copyWith(
          addFieldState:
              const AddFieldSuccess(message: "Field Added Successfully!")));
    } catch (e) {
      emit(const FieldsState(
          addFieldState: AddFieldFailed(message: "Field added successfully!")));
    }
  }

  _fetchFields(FetchFields event, Emitter<FieldsState> emit) async {
    emit(state.copyWith(
      fetchFieldsState: FetchFieldsLoading(),
    ));
    try {
      // print(emit.isDone);
      // print(state.toString());
      //     List<Field> fields = [];
 
      //   repo.fetchAllFields().listen((eve) async {
      //     List json = eve.docs;
      //     for (var element in json) {
      //       Field field = Field.fromMap(element.data());
      //       fields.add(field);
      //     }
        
      //        emit(
      //   state.copyWith(
      //     fetchFieldsState: FetchFieldsSuccess(data: fields)
      //   )
      // );
        
        // });
      List<Field> fields = [];

      await emit.forEach(repo.fetchAllFields(), onData: (info) {
        List json = info.docs;
        for (var element in json) {
          Field field = Field.fromMap(element.data());
          if (!fields.contains(field)) {
            fields.add(field);
          }
        }
        return state.copyWith(
          fetchFieldsState: FetchFieldsSuccess(data: fields)
        );
      });

    } catch (e) {
      emit(
        state.copyWith(
          fetchFieldsState: FetchFieldsFailed(message: e.toString()),
        ),
      );
    }
  }
}
