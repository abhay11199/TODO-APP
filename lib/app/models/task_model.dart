class Task {
  int? id;
  String? title;
  String? description;

  Task({this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'description': description,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
  }
}
