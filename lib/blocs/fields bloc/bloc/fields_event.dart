// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fields_bloc.dart';

abstract class FieldsEvent extends Equatable {
  const FieldsEvent();

  @override
  List<Object> get props => [];
}

class AddField extends FieldsEvent {
  final Field field;
  const AddField({
    required this.field,
  });
}

class FetchFields extends FieldsEvent {}