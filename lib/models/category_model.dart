class CategotyModel {
  String id = "";
  String name = "";
  String imageUrl = "";
  int createdAt = 0;
  int updatedAt = 0;

  CategotyModel(
      this.id, this.name, this.imageUrl, this.createdAt, this.updatedAt);

  CategotyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
