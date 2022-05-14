import '../error/exception_to_failure_mapper.dart';
import '../error/failure.dart';

abstract class IBaseRepository {
  Failure handleException(Object? e) {
    return mapExceptionToFailure(e);
  }
}
