import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'errors/failures.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

//class NoParams extends Equatable {
class NoParams {
  // @override
  // List<Object?> get props => [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoParams;
  }

  @override
  int get hashCode {
    return hashCode;
  }
}
