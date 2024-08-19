// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SliderModel {
  String imagePath;
  SliderModel({
    required this.imagePath,
  });
  // String title;

  SliderModel copyWith({
    String? imagePath,
  }) {
    return SliderModel(
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePath': imagePath,
    };
  }

  factory SliderModel.fromMap(Map<String, dynamic> map) {
    return SliderModel(
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SliderModel.fromJson(String source) =>
      SliderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SliderModel(imagePath: $imagePath)';

  @override
  bool operator ==(covariant SliderModel other) {
    if (identical(this, other)) return true;

    return other.imagePath == imagePath;
  }

  @override
  int get hashCode => imagePath.hashCode;
}
