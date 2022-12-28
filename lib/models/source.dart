class Source {
  String? id;
  String? name;
  Source({this.id, required this.name});
  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    name = json["name"].toString();
  }
}