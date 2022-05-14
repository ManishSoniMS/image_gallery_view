import 'dart:io';

import 'exceptions.dart';
import 'failure.dart';

Failure mapExceptionToFailure(Object? e) {
  if (e is SocketException) {
    return Failure(
      code: 0,
      message: e.message,
    );
  }
  if (e is GeneralException) {
    return Failure(
      code: 0,
      message: e.message,
    );
  }
  if (e is AssertionError) {
    return Failure(
      code: 0,
      message: e.message.toString(),
    );
  }
  return const Failure(
    code: 1,
    message: "Something went wrong",
  );
}
