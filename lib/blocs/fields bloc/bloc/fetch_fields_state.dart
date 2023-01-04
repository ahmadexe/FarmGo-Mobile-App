// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farmgo/models/field.dart';

import 'fields_bloc.dart';

class FetchFieldsState extends FieldsState {
  final List<Field>? data;
  final String? message;
  const FetchFieldsState({
    this.data,
    this.message,
  });
}

class FetchFieldsLoading extends FetchFieldsState {}

class FetchFieldsSuccess extends FetchFieldsState {
  const FetchFieldsSuccess({List<Field>? data}) : super(data: data);
}

class FetchFieldsFailed extends FetchFieldsState {
  const FetchFieldsFailed({String? message}) : super(message: message);
}
