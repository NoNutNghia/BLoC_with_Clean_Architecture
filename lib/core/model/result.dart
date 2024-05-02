import 'package:bloc_with_clean_architecture/core/enum/error_type.dart';

class Result<T> extends SealedResult<T> {
  bool get isSuccessful => this is Success<T>;
}

class Success<T> extends Result<T> {
  T? data;

  Success(this.data);
}

class Failure<T> extends Result<T> {
  ErrorType type;
  String message;

  Failure(this.type, this.message);

  bool get isTokenExpired => type == ErrorType.tokenExpired;
}

sealed class SealedResult<T> {
  R? when<R>({
    R Function(T?)? success,
    R Function(ErrorType, String)? failure,
  }) {
    if (this is Success<T>) {
      return success?.call(((this as Success).data));
    }

    if (this is Failure<T>) {
      return failure?.call(
        ((this as Failure<T>).type),
        ((this as Failure<T>).message),
      );
    }

    throw Exception(
      'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build',
    );
  }
}
