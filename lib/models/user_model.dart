// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class UserModel extends Equatable {
  String name;
  String userName;
  String contact;
  String email;
  String imgUrl;
  String userId;
  bool isInvestor;
  bool isLoggedIn;
  UserModel({
    required this.name,
    required this.email,
    required this.imgUrl,
    required this.userId,
    required this.isInvestor,
    required this.isLoggedIn,
    required this.userName,
    required this.contact,
  });
  
  @override
  List<Object> get props {
    return [
      name,
      userName,
      contact,
      email,
      imgUrl,
      userId,
      isInvestor,
      isLoggedIn,
    ];
  }

  
  static UserModel fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> snap = (doc.data() as Map<String, dynamic>);
    return UserModel(userId: snap['userId'], name: snap['name'], email: snap['email'], imgUrl: snap['imgUrl'], isInvestor: false, isLoggedIn: false, userName: snap['username'], contact: snap['contact']);
  }

  UserModel copyWith({
    String? name,
    String? userName,
    String? contact,
    String? email,
    String? imgUrl,
    String? userId,
    bool? isInvestor,
    bool? isLoggedIn,
  }) {
    return UserModel(
      name: name ?? this.name,
      userName: userName ?? this.userName,
      contact: contact ?? this.contact,
      email: email ?? this.email,
      imgUrl: imgUrl ?? this.imgUrl,
      userId: userId ?? this.userId,
      isInvestor: isInvestor ?? this.isInvestor,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'userName': userName,
      'contact': contact,
      'email': email,
      'imgUrl': imgUrl,
      'userId': userId,
      'isInvestor': isInvestor,
      'isLoggedIn': isLoggedIn,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      userName: map['userName'] as String,
      contact: map['contact'] as String,
      email: map['email'] as String,
      imgUrl: map['imgUrl'] as String,
      userId: map['userId'] as String,
      isInvestor: map['isInvestor'] as bool,
      isLoggedIn: map['isLoggedIn'] as bool,
    );
  }

  @override
  bool get stringify => true;
}
