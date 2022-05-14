import 'package:dartz/dartz.dart';

import '../error/failure.dart';

typedef FailureOr<T> = Future<Either<Failure, T>>;
