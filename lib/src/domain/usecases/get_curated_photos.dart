import 'package:equatable/equatable.dart';
import 'package:walley_app/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:walley_app/src/domain/entites/photos.dart';

import '../../core/usecase/use_case.dart';
import '../repositories/photos_repositories.dart';

class GetCuratedPhotos implements UserCase<List<Photos>, Params> {
  final PhotosRepositories repository;
  GetCuratedPhotos(this.repository);

  @override
  Future<Either<Failure, List<Photos>>> call(params) {
    return repository.getCuratedPhotos(
        page: params.page, perPage: params.perPage);
  }
}

class Params extends Equatable {
  final int page;
  final int perPage;

  const Params(this.page, this.perPage);

  @override
  List<Object?> get props => [page, perPage];
}
