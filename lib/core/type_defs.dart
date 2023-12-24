import 'package:fpdart/fpdart.dart';
import 'package:x_clone_app/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
