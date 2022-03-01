import 'package:walley_app/src/core/enum/categories_type.dart';
import 'package:walley_app/src/domain/entites/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel(
      {required String id,
      required CategoriesType value,
      required String image})
      : super(id: id, value: value, image: image);

  static getCategorieList() {
    List<CategoriesModel> categories = [];
    categories.add(
      const CategoriesModel(
          id: "0",
          value: CategoriesType.Abstract,
          image: "assets/images/abstract_image.png"),
    );

    categories.add(
      const CategoriesModel(
          id: "1",
          value: CategoriesType.Animals,
          image: "assets/images/animals.png"),
    );

    categories.add(
      const CategoriesModel(
          id: "2",
          value: CategoriesType.Architecture,
          image: "assets/images/architecture.png"),
    );
  }
}
