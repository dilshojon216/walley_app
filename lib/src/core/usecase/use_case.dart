import 'package:dartz/dartz.dart';

import '../error/failures.dart';

//
abstract class UserCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
