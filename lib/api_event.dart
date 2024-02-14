part of 'api_bloc.dart';

abstract class ApiEvent {}

class FetchData extends ApiEvent {
  final String endpoint;

  FetchData(this.endpoint);
}
