import 'package:equatable/equatable.dart';

abstract class ConfigState extends Equatable {
  const ConfigState();

  ConfigState getStateCopy();
}

// A sample class with no initialisation
class UnConfigState extends ConfigState {
  @override
  String toString() {
    return 'UnConfigState';
  }

  @override
  ConfigState getStateCopy() {
    return UnConfigState();
  }

  @override
  List<Object> get props => null;
}

// A sample class with initialisation
class InConfigState extends ConfigState {
  @override
  String toString() {
    return 'InConfigState';
  }

  @override
  ConfigState getStateCopy() {
    return InConfigState();
  }

  @override
  List<Object> get props => null;
}

// A sample class with error config
class ErrorConfigState extends ConfigState {
  final String errorMessage;

  ErrorConfigState(this.errorMessage);

  @override
  String toString() {
    return 'ErrorConfigState';
  }

  @override
  ConfigState getStateCopy() {
    return ErrorConfigState(this.errorMessage);
  }

  @override
  List<Object> get props => null;
}