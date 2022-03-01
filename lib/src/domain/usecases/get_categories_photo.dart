import 'package:walley_app/src/core/enum/categories_type.dart';
import 'package:walley_app/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:walley_app/src/core/usecase/use_case.dart';
import 'package:walley_app/src/data/models/photos_model.dart';
import 'package:walley_app/src/domain/entites/photos.dart';

import '../repositories/photos_repositories.dart';

class GetCategories implements UserCase<List<Photos>, Params> {
  final PhotosRepositories repository;

  GetCategories(this.repository);

  @override
  Future<Either<Failure, List<Photos>>> call(Params params) async {
    return repository.getSearchPhotos(
      query: params.categories.toString(),
      page: params.page,
      perPage: params.perPage,
    );
  }
}

class Params {
  final int page;
  final int perPage;
  final CategoriesType categories;

  const Params(this.page, this.perPage, this.categories);

  @override
  List<Object?> get props => [page, perPage];
}
