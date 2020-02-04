import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigState extends Equatable {
  ConfigState([List props = const <dynamic>[]]) : super();

  ConfigState getStateCopy();
}

class UnConfigState extends ConfigState {
  @override
  String toString() => 'UnConfigState';
  @override
  ConfigState getStateCopy() {
    return UnConfigState();
  }

  @override
  List<Object> get props => null;
}

class InConfigState extends ConfigState {
  @override
  String toString() => 'InConfigState';
  @override
  ConfigState getStateCopy() {
    return InConfigState();
  }

  @override
  List<Object> get props => null;
}

class ErrorConfigState extends ConfigState {
  final String errorMessage;

  ErrorConfigState(this.errorMessage);

  @override
  String toString() => 'ErrorConfigState';
  @override
  ConfigState getStateCopy() {
    return ErrorConfigState(this.errorMessage);
  }

  @override
  List<Object> get props => null;
}
