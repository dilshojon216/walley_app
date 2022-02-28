import 'package:dartz/dartz.dart';
import 'package:walley_app/src/data/datasoureces/api_photos.dart';

import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entites/photos.dart';
import '../../domain/repositories/photos_repositories.dart';
import '../models/photos_model.dart';

class PhotosRepositoriesImpl implements PhotosRepositories {
  final ApiPhotos apiPhotos;
  final NetworkInfo networkInfo;

  PhotosRepositoriesImpl(this.apiPhotos, this.networkInfo);

// Either Left or Right
  @override
  Future<Either<Failure, List<Photos>>> getCuratedPhotos(
      {int? perPage, int? page}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = apiPhotos.getCurated(prePage: perPage, page: page);
        return _getListPhotos(result);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ServerFailure("No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<Photos>>> getSearchPhotos(
      {int? perPage, int? page, String? query}) {
    throw UnimplementedError();
  }

  //sqloqish

  Future<Either<Failure, List<Photos>>> _getListPhotos(
      Future<List<PhotosModel>> photos) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await photos;
        return Right(PhotosModel.fromListToPhotos(result));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ServerFailure("No internet connection"));
    }
  }
}
