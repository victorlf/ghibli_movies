import 'package:equatable/equatable.dart';

//abstract class Failure extends Equatable {}
abstract class Failure {}

class ServerFailure extends Failure {
  // @override
  // List<Object?> get props => [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServerFailure;
  }

  @override
  int get hashCode {
    return hashCode;
  }
}

class NullParamFailure extends Failure {
  // @override
  // List<Object?> get props => [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NullParamFailure;
  }

  @override
  int get hashCode {
    return hashCode;
  }
}
