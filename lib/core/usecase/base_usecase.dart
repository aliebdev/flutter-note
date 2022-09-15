import 'package:dartz/dartz.dart';

import '../exceptions/error.dart';

abstract class BaseUseCase<Type> {
  Future<Either<NoteError, Type>> call();
}
