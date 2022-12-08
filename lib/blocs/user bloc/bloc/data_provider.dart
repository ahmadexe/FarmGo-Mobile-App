import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../models/user_model.dart';
import '../../../static/constants.dart';
import '../../../utils/firebase_utils.dart';

class UserDataProvider {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static Future<String> signup(String username, String contact, String name,
      String email, String password, bool isInvestor) async {
    String msg = AppConstants.defaultErrorMessage;
    try {
      UserCredential credentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credentials.user != null) {
        String collection = isInvestor ? 'investors' : 'farmers';
        if (isInvestor) {
          await _firestore
              .collection(collection)
              .doc(credentials.user!.uid)
              .set({
            'username': username,
            'contact': contact,
            'name': name,
            'email': email,
            'userId': credentials.user!.uid,
            'imgUrl': AppConstants.defaultProfileImgUrl,
          });
        }
        return AppConstants.success;
      }
    } on FirebaseAuthException catch (e) {
      String message = FirebaseUtils.getMessageFromErrorCode(e.code);
      return message;
    }
    return msg;
  }

  static Future<dynamic> login(
      String email, String password, bool isInvestor) async {
    try {
      UserCredential credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel? userModel =
          await _getUserDetails(isInvestor, credentials.user!.uid);
      if (userModel != null) {
        userModel.email = email;
        userModel.isInvestor = isInvestor;
        userModel.isLoggedIn = true;
      }
      return userModel;
    } on FirebaseAuthException catch (e) {
      String message = FirebaseUtils.getMessageFromErrorCode(e.code);
      return message;
    }
  }

  static Future<UserModel?> _getUserDetails(
      bool isInvestor, String userId) async {
    String docName;
    docName = isInvestor ? 'investors' : 'farmers';
    DocumentSnapshot doc =
        await _firestore.collection(docName).doc(userId).get();
    if (doc.exists == false) {
      return null;
    }
    UserModel user = UserModel.fromJson(doc);
    user.isInvestor = isInvestor;
    return user;
  }
}
