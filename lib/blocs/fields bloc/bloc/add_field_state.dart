// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'fields_bloc.dart';

class AddFieldState extends FieldsState {
  final String? message;
  const AddFieldState({
    this.message,
  });
}

class AddFieldLoading extends AddFieldState {}

class AddFieldSuccess extends AddFieldState {
  const AddFieldSuccess({String? message}) : super(message: message);
}

class AddFieldFailed extends AddFieldState {
  const AddFieldFailed({String? message}) : super(message: message);
}
