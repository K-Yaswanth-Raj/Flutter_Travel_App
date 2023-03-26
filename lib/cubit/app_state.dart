import 'package:equatable/equatable.dart';

import '../services/model/model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  final List<Model> places;
  LoadedState(this.places);
  @override
  List<Object?> get props => [places];
}

class DetailState extends CubitStates {
  final Model place;

  DetailState(this.place);

  @override
  List<Object?> get props => [place];
}
