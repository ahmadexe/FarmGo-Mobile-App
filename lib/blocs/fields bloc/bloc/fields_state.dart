// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fields_bloc.dart';

class FieldsState extends Equatable {
  final AddFieldState? addFieldState;
  final FetchFieldsState? fetchFieldsState;

  const FieldsState({this.addFieldState, this.fetchFieldsState});

  @override
  List<Object?> get props => [addFieldState, fetchFieldsState];

  FieldsState copyWith({
    AddFieldState? addFieldState,
    FetchFieldsState? fetchFieldsState,
  }) {
    return FieldsState(
      addFieldState: addFieldState ?? this.addFieldState,
      fetchFieldsState: fetchFieldsState ?? this.fetchFieldsState,
    );
  }
}