class User{

  String? id;
  String? name;
  String? email;
  String? picture;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.picture
  });

  User.fromJson(Map<String, dynamic> json){
    id = json['id'] == null ? null: json['id'];
    name = json['name'] == null ? null: json['name'];
    email = json['email'] == null ? null: json['email'];
    picture = json['picture'] == null ? null: json['picture'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['picture'] = picture;
    return data;
  }
}