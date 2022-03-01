import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:walley_app/src/core/error/failures.dart';
import 'package:walley_app/src/core/usecase/use_case.dart';
import 'package:walley_app/src/domain/entites/photos.dart';

import '../repositories/photos_repositories.dart';

class GetSearchPhotos implements UserCase<List<Photos>, Params> {
  final PhotosRepositories repository;

  GetSearchPhotos(this.repository);

  @override
  Future<Either<Failure, List<Photos>>> call(Params params) {
    return repository.getSearchPhotos(
        query: params.query, page: params.page, perPage: params.perPage);
  }
}

class Params extends Equatable {
  final String query;
  final int page;
  final int perPage;

  const Params(this.query, this.page, this.perPage);

  @override
  List<Object?> get props => [query, page, perPage];
}
