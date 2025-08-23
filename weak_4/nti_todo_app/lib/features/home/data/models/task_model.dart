class TaskModel{
  String? title;
  String? description;

  TaskModel({this.title, this.description});
  TaskModel.fromJson(Map<String,dynamic> json){
    title = json["title"];
    description = json["description"];
  }

  Map<String,dynamic> toJson(){
    return{
      "title":title,
      "description":description
    };
  }
}