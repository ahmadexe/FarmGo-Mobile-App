import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        await _firestore.collection(collection).doc(credentials.user!.uid).set({
          'username': username,
          'contact': contact,
          'name': name,
          'email': email,
          'userId': credentials.user!.uid,
          'imgUrl': AppConstants.defaultProfileImgUrl,
        });

        return AppConstants.success;
      }
    } on FirebaseAuthException catch (e) {
      String message = FirebaseUtils.getMessageFromErrorCode(e.code);
      return message;
    }
    return msg;
  }

  static Future<User> login(
      String email, String password, bool isInvestor) async {
    try {
      UserCredential credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credentials.user!;
    } on FirebaseAuthException catch (e) {
      String message = FirebaseUtils.getMessageFromErrorCode(e.code);
      throw (message);
    } catch (e) {
      throw (e.toString());
    }
  }

  static Stream<User?> getAuthStatus() {
    try {
      return _auth.authStateChanges();
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<UserModel> getUserDetails(
      bool isInvestor, String userId) async {
    try {
      String docName;
      docName = isInvestor ? 'investors' : 'farmers';
      DocumentSnapshot doc =
          await _firestore.collection(docName).doc(userId).get();
      UserModel user = UserModel.fromJson(doc);
      UserModel userUpdated =
          user.copyWith(isInvestor: isInvestor, isLoggedIn: true);
      return userUpdated;
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<void> logout() async {
    await _auth.signOut();
  }
}
