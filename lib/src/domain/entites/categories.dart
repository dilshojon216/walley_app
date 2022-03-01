import 'package:equatable/equatable.dart';
import 'package:walley_app/src/core/enum/categories_type.dart';

class Categories extends Equatable {
  final String id;
  final CategoriesType value;
  final String image;

  const Categories(
      {required this.id, required this.value, required this.image});

  @override
  List<Object?> get props => [id, value, image];
}
