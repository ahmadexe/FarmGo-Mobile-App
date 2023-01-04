import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmgo/blocs/fields%20bloc/bloc/data_provider.dart';

import '../../../models/field.dart';

class FieldsRepository {
  Future<void> addAField(Field field) => FieldsDataProvider.addAField(field); 
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllFields() => FieldsDataProvider.fetchAllFields();
}