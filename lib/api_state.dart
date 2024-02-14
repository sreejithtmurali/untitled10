part of 'api_bloc.dart';


// States
abstract class ApiState {}

class ApiInitialState extends ApiState {}

class ApiLoadingState extends ApiState {}

class ApiLoadedState extends ApiState {
  final dynamic data;

  ApiLoadedState(this.data);
}

class ApiErrorState extends ApiState {
  final String message;

  ApiErrorState(this.message);
}
