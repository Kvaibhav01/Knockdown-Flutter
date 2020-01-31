import 'package:devfest_demo/config/index.dart';
import 'package:devfest_demo/utils/devfest_demo.dart';
import 'package:equatable/equatable.dart';

//? The 'Equatable' package checks the equality of two objects
abstract class ConfigEvent extends Equatable {
  const ConfigEvent();

  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent {
  final bool darkOn;

  DarkModeEvent(this.darkOn);

  @override
  String toString() {
    return 'DarkModeEvent';
  }

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async {
    try {
      bloc.darkModeOn = darkOn;

      // Set the new preference
      DevFestDemo.prefs.setBool(DevFestDemo.darkModePref, darkOn);
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');

      // If the error is not null then convert it to a string
      return ErrorConfigState(_?.toString());
    }
  }

  @override
  List<Object> get props => null;

}

// A dummy event for demonstration
class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() {
    return 'LoadConfigEvent';
  }

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async {
    try {
      // Add a 2 second delay
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');

      // If the error is not null then convert it to a string
      return ErrorConfigState(_?.toString());
    }
  }

  @override
  List<Object> get props => null;

}