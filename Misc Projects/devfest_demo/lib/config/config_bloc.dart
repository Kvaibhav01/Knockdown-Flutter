//* The default configuration file

import 'package:bloc/bloc.dart';
import 'index.dart';

//? An 'event' is any input(syncing), a 'state' is the output(screen) we get
class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  // Make a singleton to apply it to the whole app and create a single instance of it
  static final ConfigBloc _configBlocSingleton = ConfigBloc._internal();

  factory ConfigBloc() {
    return _configBlocSingleton;
  }
  // Make an internal constructor so that it isn't accesible from anywhere outside
  ConfigBloc._internal();

  //* Implement light/dark mode config
  bool darkModeOn = false;

  @override
  ConfigState get initialState => UnConfigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {

  }
}