class Chats{
  String? name;
  String? image;
  String? message;
  String? createdAt;

Chats.fromJson(Map json){
  name = json["name"];
  image = json["image"];
  message = json["message"];
  createdAt = json["createdAt"];
}
}