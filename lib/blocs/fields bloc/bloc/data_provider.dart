import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/field.dart';

class FieldsDataProvider {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final _fieldsCollection = _firestore.collection('fields');

  static Future<void> addAField(Field field) async {
    try {
      await _fieldsCollection.doc(field.id).set(field.toMap());
    } catch (e) {
      throw ("An error occured. Can't add the field at the moment. Please try later");
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllFields() {
    try{
      return _fieldsCollection.snapshots().asBroadcastStream();
    } catch (e) {
      throw ("Can't load fields. Please try later!");
    }
  }
}