part of 'fields_bloc.dart';

abstract class FieldsState extends Equatable {
  const FieldsState();
  
  @override
  List<Object> get props => [];
}

class FieldsInitial extends FieldsState {}
