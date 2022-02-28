import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entites/photos.dart';

abstract class PhotosRepositories {
  Future<Either<Failure, List<Photos>>> getCuratedPhotos(
      {int perPage, int page});
  Future<Either<Failure, List<Photos>>> getSearchPhotos(
      {int perPage, int page, String query});
}
