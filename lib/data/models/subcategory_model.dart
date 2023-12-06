import '../../domain/entities/subCategory.dart';

class SubCategoryModel extends SubCategory {

  const SubCategoryModel(
 { 
    required super.name,
}
    );

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
      name: json['name'],
     
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    

  };
}
