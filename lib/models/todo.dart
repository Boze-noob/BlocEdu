
class ToDo{

  int? id;
  final int isCompleted;
  final String text;

  ToDo({this.id, required this.isCompleted, required this.text});

  factory ToDo.fromMap(Map<String, dynamic> json) => ToDo(
    id: json["id"],
    isCompleted: json["isCompleted"],
    text: json["text"]
  );
  Map<String, dynamic> toMap() => {
    "id": id,
    "isCompleted": isCompleted,
    "text": text
  };
}