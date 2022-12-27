// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Field {
  final String fieldName;
  final double latitude;
  final double longitude;
  final String ownerName;
  final String ownerId; 
  Field({
    required this.fieldName,
    required this.latitude,
    required this.longitude,
    required this.ownerName,
    required this.ownerId,
  });

  Field copyWith({
    String? fieldName,
    double? latitude,
    double? longitude,
    String? ownerName,
    String? ownerId,
  }) {
    return Field(
      fieldName: fieldName ?? this.fieldName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      ownerName: ownerName ?? this.ownerName,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fieldName': fieldName,
      'latitude': latitude,
      'longitude': longitude,
      'ownerName': ownerName,
      'ownerId': ownerId,
    };
  }

  factory Field.fromMap(Map<String, dynamic> map) {
    return Field(
      fieldName: map['fieldName'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      ownerName: map['ownerName'] as String,
      ownerId: map['ownerId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Field.fromJson(String source) => Field.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Field(fieldName: $fieldName, latitude: $latitude, longitude: $longitude, ownerName: $ownerName, ownerId: $ownerId)';
  }

  @override
  bool operator ==(covariant Field other) {
    if (identical(this, other)) return true;
  
    return 
      other.fieldName == fieldName &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.ownerName == ownerName &&
      other.ownerId == ownerId;
  }

  @override
  int get hashCode {
    return fieldName.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      ownerName.hashCode ^
      ownerId.hashCode;
  }
}
