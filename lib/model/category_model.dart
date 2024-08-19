// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  String? name;
  String? image;
  // final String? id;

  CategoryModel({
    this.name,
    this.image,
  });

  CategoryModel copyWith({
    String? name,
    String? image,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}

List<CategoryModel> categoryList = [
  CategoryModel(name: 'Apperal', image: 'assets/icons/apperal_cat_icon.png'),
  CategoryModel(name: 'School', image: 'assets/icons/school_cat_icon.png'),
  CategoryModel(name: 'Sports', image: 'assets/icons/sports_cat_icon.png'),
  CategoryModel(
      name: 'Electronic', image: 'assets/icons/electronic_cat_icon.png'),
  CategoryModel(name: 'All', image: 'assets/icons/all_cat_icon.png'),
];
