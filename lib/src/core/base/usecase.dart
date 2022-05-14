import 'type_def.dart';

class NoParam {}

abstract class IUsecase<ReturnType, Param> {
  FailureOr<ReturnType> call(Param param);
}
